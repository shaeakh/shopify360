import 'package:flutter/material.dart';

class Product {
  final int id;
  final String productName;
  final double price;
  final bool favourite;
  final String pictureUrl;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.favourite,
    required this.pictureUrl,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id'].toString()),
      productName: json['name'] ?? '',
      price: double.parse(json['price'].toString()),
      favourite: json['favourite'] ?? false,
      pictureUrl: json['image'] ?? 'https://www.transparentpng.com/thumb/t-shirt/JcvzGC-orange-t-shirt-image.png',
    );
  }
}

class ProductCard1 extends StatelessWidget {
  final Product product;

  const ProductCard1({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // The card behind
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            // top padding to leave space for image overlap
            padding: const EdgeInsets.only(top: 60, left: 8, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.productName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "\$${product.price.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),

                // Favourite icon
                Icon(
                  Icons.favorite,
                  color: product.favourite ? Colors.red : Colors.grey,
                ),
              ],
            ),
          ),
        ),

        // Overlapping product image
        Positioned(
          top: -20,
          child: Image.network(
            product.pictureUrl,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
