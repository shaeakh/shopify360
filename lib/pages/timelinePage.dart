import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify360/widgets/timeline/home.dart';

import '../widgets/timeline/cart.dart';
import '../widgets/timeline/favourites.dart';
import '../widgets/timeline/profile.dart';
import '../widgets/timeline/search.dart';
class timelinepage extends StatefulWidget{
  const timelinepage({super.key});
  @override
  State<timelinepage> createState() => _timelinepage();
}

class _timelinepage extends State<timelinepage>{
  int selected_index = 0;
  final List<Widget>_pages = [
    Home(),
    Cart(),
    Favourites(),
    Profile(),
    Search_()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        leading: Icon(
          Icons.chevron_left,
          color: Colors.grey,
          size: 40,
        ),
        actions: [
          IconButton(
              onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.grey,)
          ),
        ],
      ),
      body: _pages[selected_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: selected_index,
        onTap: (int index){
            setState(() {
              selected_index = index;
            });
        },
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),label: "",
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: 20,
                  color: Colors.brown,
                ),
                SizedBox(height: 4,),
                Icon(Icons.home)
              ],
            )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),label: "",
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 20,
                    color: Colors.brown,
                  ),
                  SizedBox(height: 4,),
                  Icon(Icons.search)
                ],
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),label: "",
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 20,
                    color: Colors.brown,
                  ),
                  SizedBox(height: 4,),
                  Icon(Icons.shopping_cart_outlined)
                ],
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),label: "",
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 20,
                    color: Colors.brown,
                  ),
                  SizedBox(height: 4,),
                  Icon(Icons.favorite_border)
                ],
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined),label: "",
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 20,
                    color: Colors.brown,
                  ),
                  SizedBox(height: 4,),
                  Icon(Icons.person_3_outlined)
                ],
              )
          ),
        ],
      ),
    );
  }
}