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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/landing_page.jpg"),
            Text("View product 360 degrees",
              style: TextStyle(
                color: Colors.brown,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "You can see product with all angles, true, and convenient",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
                onPressed: (){},
                child: Text(
                    "data",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}