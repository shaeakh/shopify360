import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Favourites extends StatefulWidget{
  const Favourites({super.key});
  @override
  State<Favourites> createState() => _Favourites();
}

class _Favourites extends State<Favourites>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Text("Text"),
        padding: EdgeInsets.symmetric(vertical:0 ,horizontal: 16)
    );
  }
}