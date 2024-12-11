import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/landingpage/page_1.jpg"),
        SizedBox(height: 20),
        Text(
          "View product 360 degrees",
          style: TextStyle(
              color: Colors.brown, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "You can see product with all angles, true, and convenient",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/landingpage/page_2.jpg"),
        SizedBox(height: 20),
        Text(
          "Find products easily",
          style: TextStyle(
              color: Colors.brown, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "You just need to take a photo or upload and we will find similar products for you",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/landingpage/page_3.jpg"),
        SizedBox(height: 20),
        Text(
          "Payment is easy",
          style: TextStyle(
              color: Colors.brown, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "You just need to take a photo or upload and we will find similar products for you",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    )
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      int nextPage = (_currentPage + 1) % 3;
      if (nextPage != _currentPage) {
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _pages.length; i++)
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: _currentPage == i ? 10 : 8,
            height: _currentPage == i ? 10 : 8,
            decoration: BoxDecoration(
              color: _currentPage == i ? Colors.brown : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 16),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Expanded(
    child: PageView(
    controller: _pageController,
    onPageChanged: (int index) {
    setState(() {
    _currentPage = index;});
    },
      children: _pages,
    ),
    ),
      SizedBox(height: 20),
      _buildPageIndicator(),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {},
        child: SizedBox(
          width: 250,
          child: Text(
            "Get Started!",
            style: TextStyle(
                color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)),
          padding:
          EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        ),
      ),
      SizedBox(height: 40),
    ],
    ),
        )),
    );
  }
}