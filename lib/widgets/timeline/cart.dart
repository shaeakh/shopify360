import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Cart extends StatefulWidget{
  const Cart({super.key});
  @override
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Text("Text"),
        padding: EdgeInsets.symmetric(vertical:0 ,horizontal: 16)
    );
  }
}