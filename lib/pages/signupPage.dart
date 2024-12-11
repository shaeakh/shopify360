import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Signuppage extends StatefulWidget{
  const Signuppage({super.key});
  @override
  State<Signuppage> createState() => _Signuppage();
}

class _Signuppage extends State<Signuppage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hi this is signin page"),
    );
  }
}