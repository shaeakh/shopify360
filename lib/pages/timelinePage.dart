import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify360/widgets/timeline/cart.dart';
import 'package:shopify360/widgets/timeline/favourites.dart';
import 'package:shopify360/widgets/timeline/profile.dart';
import 'package:shopify360/widgets/timeline/search.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);
class Product {
  final String id;
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
}
final List<Product> staticProducts = [
  Product(
    id: "1",
    productName: "Handbag LV",
    price: 225,
    favourite: true,
    pictureUrl: "assets/timelinepage/products/bag.png",
  ),
  Product(
    id: "2",
    productName: "Shoes",
    price: 201,
    favourite: false,
    pictureUrl: "assets/timelinepage/products/shoe.png",
  ),
  Product(
    id: "3",
    productName: "T-shirt",
    price: 400,
    favourite: false,
    pictureUrl: "assets/timelinepage/products/t-shirt.png",
  ),
  Product(
    id: "4",
    productName: "Shorts",
    price: 100,
    favourite: true,
    pictureUrl: "assets/timelinepage/products/shorts.png",
  ),
];

class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    final List<Widget> _pages = [
      Home(),
      Search_(),
      Cart(),
      Favourites(),
      Profile(),
    ];

    return Scaffold(
      body: Padding(
        child: _pages[selectedIndex],
          padding: EdgeInsets.only(top: 30)
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (int index) {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              activeIcon: _buildActiveIcon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
              activeIcon: _buildActiveIcon(Icons.search)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "",
              activeIcon: _buildActiveIcon(Icons.shopping_cart_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "",
              activeIcon: _buildActiveIcon(Icons.favorite_border)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined),
              label: "",
              activeIcon: _buildActiveIcon(Icons.person_3_outlined)),
        ],
      ),
    );
  }

  Widget _buildActiveIcon(IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: 20,
          color: Colors.brown,
        ),
        SizedBox(height: 4),
        Icon(icon, color: Colors.brown),
      ],
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 32,
        childAspectRatio:1.1,
      ),
      itemCount: staticProducts.length,
      itemBuilder: (context, index) {
        final product = staticProducts[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card Background
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 8, right: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    product.favourite ? Icons.favorite : Icons.favorite_border,
                    color: product.favourite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Overlapping Image
        Positioned(
          top: -20,
          left: 20,
          right: 20,
          child: Image.asset(
            product.pictureUrl,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
