import 'package:flutter/material.dart';

class Search_ extends StatefulWidget {
  const Search_({super.key});
  @override
  State<Search_> createState() => _Search_();
}

class _Search_ extends State<Search_> {
  bool show_resent_search = true;
  int state_ = 1;
  int selectedTab = 0;
  final search = TextEditingController();
  List<String> suggestions = [
    "T-shirt",
    "Jeans",
    "Shoes",
    "Bags",
    "Accessories"
  ];
  void _onTabSelected(int index) {
    setState(() {
      selectedTab = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: search,
                  cursorColor: Colors.brown,
                  cursorOpacityAnimates: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.brown,
                    ),
                    suffixIcon: Icon(
                      Icons.camera_alt_outlined,
                      color: const Color(0xFF989A99),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      state_ = value.isEmpty ? ((state_ == 2) ? 3 : 1) : 2;
                    });
                  },
                ),
                SizedBox(height: 10),
                if (state_ == 1) ...[
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onTabSelected(0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedTab == 0
                                        ? Colors.brown
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Woman",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedTab == 0
                                      ? Colors.brown
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onTabSelected(1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedTab == 1
                                        ? Colors.brown
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Men",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedTab == 1
                                      ? Colors.brown
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female, size: 100, color: Colors.pink),
                              Text(
                                "Welcome to Women's Section",
                                style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, size: 100, color: Colors.blue),
                              Text(
                                "Welcome to Men's Section",
                                style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else if (state_ == 2) ...[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.search, color: Colors.grey),
                        title: Text(suggestions[index]),
                        onTap: () {
                          setState(() {
                            search.text = suggestions[index];
                            state_ = 2;
                          });
                        },
                      );
                    },
                  ),
                ] else if (state_ == 3) ...[
                  show_resent_search
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Contact prefested in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      show_resent_search = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.pink,
                                  ),
                                )
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: suggestions.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading:
                                      Icon(Icons.search, color: Colors.grey),
                                  title: Text(suggestions[index]),
                                  onTap: () {
                                    setState(() {
                                      search.text = suggestions[index];
                                      state_ = 2;
                                    });
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      : Image.asset(
                          "assets/timelinepage/nosearch.jpg",
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: double.infinity,
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        )
                ]
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
    );
  }
}
