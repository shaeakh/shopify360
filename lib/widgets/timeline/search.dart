import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Search_ extends StatefulWidget {
  const Search_({super.key});
  @override
  State<Search_> createState() => _Search_();
}

class _Search_ extends State<Search_> {
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
                      state_ = value.isEmpty ? ((state_==2)? 3 :1) : 2;
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
                            onTap: () {
                              setState(() {
                                selectedTab = 0;
                              });
                            },
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
                            onTap: () {
                              setState(() {
                                selectedTab = 1;
                              });
                            },
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
                ]
                else if (state_ == 2) ...[
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
                ]
                else if (state_==3) ...[
                  Image.asset(
                    "assets/timelinepage/nosearch.jpg",
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
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
