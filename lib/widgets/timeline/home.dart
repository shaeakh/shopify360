import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shopify360/widgets/timeline/card1.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  static const Map<String, dynamic> dammyProduct = {
    "id": '1',
    "product_name": "Handbag LV",
    "price": 225,
    "favourite": true,
    "picture_url":
        "https://www.transparentpng.com/thumb/t-shirt/JcvzGC-orange-t-shirt-image.png"
  };
  final product = Product.fromJson(dammyProduct);

  final baseUrl = dotenv.env['backend_URL'];
  List<Product>? Products;
  String? error;
  var data;
  void fetchdata() async {
    setState(() {
      error = null;
      Products = null;
    });

    final url = Uri.parse('${baseUrl}/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List<dynamic> productList = jsonData;
        setState(() {
          Products = productList.map((item) => Product.fromJson(item)).toList();
        });
      } else {
        setState(() {
          error = 'Failed to load products: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error connecting to server: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(
          Icons.chevron_left,
          color: Colors.grey,
          size: 40,
        ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildActionButton("Sort", Icons.sort, fetchdata),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionButton("Filter", Icons.tune, fetchdata),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (error != null)
                Center(
                  child: Column(
                    children: [
                      Text(error!, style: const TextStyle(color: Colors.red)),
                      ElevatedButton(
                        onPressed: fetchdata,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              else if (Products == null)
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.brown,
                  ),
                )
              else
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  crossAxisCount: 2,
                  crossAxisSpacing:0,
                  mainAxisSpacing:0,
                  children: Products!.map((product) {
                    return ProductCard1(product: product);
                  }).toList(),
                ),

              // Products == null
              //     ? const Center(child: CircularProgressIndicator())
              //     : GridView.count(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   padding: const EdgeInsets.all(16),
              //   crossAxisCount: 2,
              //   crossAxisSpacing: 16,
              //   mainAxisSpacing: 16,
              //   children: Products!.map((product) {
              //     return ProductCard1(product: product);
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, VoidCallback onpress) {
    return OutlinedButton.icon(
      onPressed: onpress,
      icon: Icon(icon, color: Colors.brown),
      label: Text(text, style: const TextStyle(color: Colors.brown)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.brown),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
