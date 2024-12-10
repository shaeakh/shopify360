import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget{
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/landing_page.jpg"),
            ElevatedButton(onPressed: (){}, child: Text("data2")),
          ],
        ),
      ),
    );
  }
}