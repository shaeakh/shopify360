import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget{
  const Profile({super.key});
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Text("Text"),
        padding: EdgeInsets.symmetric(vertical:0 ,horizontal: 16)
    );
  }
}