import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Signuppage extends StatefulWidget{
  const Signuppage({super.key});
  @override
  State<Signuppage> createState() => _Signuppage();
}

class _Signuppage extends State<Signuppage>{
  int? selected_date;
  String? selected_month;
  int? selected_year;

  final List<int>days = List.generate(31,(index)=>index+1 );
  final List<String>months = [ 'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<int> years = List.generate(100, (index) => 2023 - index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "Sign up",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        leading: Icon(
            Icons.chevron_left,
          color: Colors.grey,
          size: 40,
        ),
      ),
      body: Padding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
            Text(
            "Email Address",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10),
          Text(
            "We'll send your order confirmation here",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey
            ),
          ),

          SizedBox(height: 20),

          Text(
            "First name",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter first name",
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 15),



          Text(
            "Last name",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter last name",
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 15),



          Text(
            "Password",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter password",
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Must be 10 or more characters",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 20,),

          Text(
            "Date of Birth",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),
          ),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                flex: 1,
                child: DropdownButtonFormField<int>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.brown,
                    ),
                    isExpanded: true,
                    hint: Center(
                      child: Text("DD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey, // Customize hint text color
                        ),
                      ),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade800),
                      ),
                    ),
                    items: days.map((day){
                      return DropdownMenuItem(child: Center(
                          child: Center(
                              child: Padding(
                                  child: Text(
                                    day.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                  padding: EdgeInsets.only(right: 2)
                              )
                          )
                      ),
                        value: day,
                      );
                    }).toList(), onChanged: (value){
                  setState(() {
                    selected_date = value;
                  });
                }
                )),
                SizedBox(width: 15),
                DropdownButtonFormField<int>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.brown,
                    ),
                    isExpanded: false,
                    hint: Center(
                      child: Text("DD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey, // Customize hint text color
                        ),
                      ),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade800),
                      ),
                    ),
                    items: days.map((day){
                      return DropdownMenuItem(child: Center(
                          child: Center(
                              child: Padding(
                                  child: Text(
                                    day.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                  padding: EdgeInsets.only(right: 2)
                              )
                          )
                      ),
                        value: day,
                      );
                    }).toList(), onChanged: (value){
                  setState(() {
                    selected_date = value;
                  });
                }
                ),
                SizedBox(width: 15),
                Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        hint: Center(
                          child: Text("MM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Customize hint text color
                            ),
                          ),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade800),
                          ),
                        ),
                        items: months.map((month){
                          return DropdownMenuItem(child: Center(
                              child: Center(
                                child: Text(
                                  month,
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),
                            value: month,
                          );
                        }).toList(), onChanged: (value){
                      setState(() {
                        selected_month = value;
                      });
                    }
                    )),
                SizedBox(width: 15),
                Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<int>(
                        isExpanded: true,
                        hint: Center(
                          child: Text("YYYY",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Customize hint text color
                            ),
                          ),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade800),
                          ),
                        ),
                        items: days.map((day){
                          return DropdownMenuItem(child: Center(
                              child: Center(
                                  child: Padding(
                                      child: Text(
                                        day.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                      padding: EdgeInsets.only(right: 2)
                                  )
                              )
                          ),
                            value: day,
                          );
                        }).toList(), onChanged: (value){
                      setState(() {
                        selected_date = value;
                      });
                    }
                    )),
              ],
          ),
        ]),
        padding: EdgeInsets.symmetric(vertical:0 ,horizontal: 16),
      ),
    );
  }
}