import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_ extends StatefulWidget {
  const Search_({super.key});
  @override
  State<Search_> createState() => _Search_();
}

class _Search_ extends State<Search_> {
  String state_ = "initial";
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                TextField(
                  controller: search,
                  cursorColor: Colors.brown,
                  cursorOpacityAnimates: true,
                  decoration: InputDecoration(

                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.brown,
                          width: 2.0,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16));
  }
}
