import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(child:Text("TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText"),padding: EdgeInsets.symmetric(vertical: 100)),
              Padding(child:Text("TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText"),padding: EdgeInsets.symmetric(vertical: 100)),
              Padding(child:Text("TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText"),padding: EdgeInsets.symmetric(vertical: 100)),
              Padding(child:Text("TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText"),padding: EdgeInsets.symmetric(vertical: 100)),
              Padding(child:Text("TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText"),padding: EdgeInsets.symmetric(vertical: 100)),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(vertical:0 ,horizontal: 16)
    );
  }
}