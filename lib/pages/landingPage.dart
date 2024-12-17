import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify360/pages/signupPage.dart';
import 'package:shopify360/providers/pageprovider.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});
  @override
  ConsumerState<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends ConsumerState<LandingPage> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Image.asset("assets/landingpage/page_1.jpg", fit: BoxFit.contain)),
        SizedBox(height: 20),
        Text("View product 360 degrees", style: TextStyle(color: Colors.brown, fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("You can see product with all angles, true, and convenient", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Image.asset("assets/landingpage/page_2.jpg", fit: BoxFit.contain)),
        SizedBox(height: 20),
        Text("Find products easily", style: TextStyle(color: Colors.brown, fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("You just need to take a photo or upload and we will find similar products for you", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Image.asset("assets/landingpage/page_3.jpg", fit: BoxFit.contain)),
        SizedBox(height: 20),
        Text("Payment is easy", style: TextStyle(color: Colors.brown, fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("You just need to take a photo or upload and we will find similar products for you", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      int nextPage = (ref.read(currentPageProvider) + 1) % _pages.length;
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      ref.read(currentPageProvider.notifier).state = nextPage;
    });
  }

  Widget _buildPageIndicator(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_pages.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 10 : 8,
          height: currentPage == index ? 10 : 8,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.brown : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(currentPageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        ref.read(currentPageProvider.notifier).state = index;
                      },
                      children: _pages,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildPageIndicator(currentPage),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signuppage()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Get Started!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
