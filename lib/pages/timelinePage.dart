import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class timelinepage extends StatefulWidget{
  const timelinepage({super.key});
  @override
  State<timelinepage> createState() => _timelinepage();
}

class _timelinepage extends State<timelinepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
          Icons.chevron_left,
          color: Colors.grey,
          size: 40,
        ),
        actions: [
          IconButton(
              onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.grey,)
          )
        ],
      ),
    );
  }
}