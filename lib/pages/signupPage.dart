import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify360/pages/timelinePage.dart';
class Signuppage extends StatefulWidget{
  const Signuppage({super.key});
  @override
  State<Signuppage> createState() => _Signuppage();
}

class _Signuppage extends State<Signuppage>{
  int? selected_date;
  String? selected_month;
  int? selected_year;
  bool discountsSelected = false;
  bool newStaffSelected = false;
  bool exclusivesSelected = false;
  bool partnersSelected = false;
  String? _selectedGender;

  final TextEditingController  email = TextEditingController();
  final TextEditingController  first_name = TextEditingController();
  final TextEditingController  last_name = TextEditingController();
  final TextEditingController  password = TextEditingController();
  var show_prefested_email_option = true;

  bool show_pass = false;
  bool can_signUP = false;

  final List<int>days = List.generate(31,(index)=>index+1 );
  final List<String>months = [ 'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<int> years = List.generate(100, (index) => 2023 - index);

  void check_field(){
    setState(() {
      can_signUP = email.text.isNotEmpty && first_name.text.isNotEmpty && last_name.text.isNotEmpty && password.text.isNotEmpty;
    });
  }

  void handle_signup (){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TimelinePage(),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    email.addListener(check_field);
    first_name.addListener(check_field);
    last_name.addListener(check_field);
    password.addListener(check_field);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
            "Sign up",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
          icon: Icon(
          Icons.chevron_left,
          color: Colors.grey,
          size: 40,
        ),
        )
      ),
      body: Padding(
        child: SingleChildScrollView(
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
                  controller: email,
                  cursorColor: Colors.brown,
                  cursorOpacityAnimates: true,
                  decoration: InputDecoration(

                    hintText: "Enter your email",
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
                  controller: first_name,
                  cursorColor: Colors.brown,
                  cursorOpacityAnimates: true,
                  decoration: InputDecoration(
                    hintText: "Enter first name",
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
                  controller: last_name,
                  cursorColor: Colors.brown,
                  cursorOpacityAnimates: true,
                  decoration: InputDecoration(
                    hintText: "Enter last name",
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

                  cursorColor: Colors.brown,
                  cursorOpacityAnimates: true,
                  obscureText: !show_pass,
                  controller: password,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          show_pass = !show_pass;
                        });
                      },
                      child: Icon(
                          (show_pass) ? Icons.visibility : Icons.visibility_off
                      ),
                    ),
                    hintText: "Enter password",
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
                          child: Text(
                            "DD",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade800),
                          ),
                        ),
                        items: days.map((day) {
                          return DropdownMenuItem(
                            value: day,
                            child: Text(day.toString(), textAlign: TextAlign.center),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selected_date = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.brown,
                        ),
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            "MM",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade800),
                          ),
                        ),
                        items: months.map((month) {
                          return DropdownMenuItem(
                            value: month,
                            child: Text(month, textAlign: TextAlign.center),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selected_month = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<int>(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.brown,
                        ),
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            "YYYY",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade800),
                          ),
                        ),
                        items: years.map((year) {
                          return DropdownMenuItem(
                            value: year,
                            child: Text(year.toString(), textAlign: TextAlign.center),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selected_year = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "You need to be 16 or over to use Ebay",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Padding(
                        child: Text(
                          "Mostly Interested in",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),
                        ),
                        padding: EdgeInsets.only(right: 8)
                    ),
                    Text(
                      "(Optional):",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 2)
                        ),
                      ]

                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                              activeColor: Colors.brown,
                              value: "Womenswear", groupValue: _selectedGender, onChanged: (value){
                            setState(() {
                              _selectedGender = value;
                            });
                          }),
                          Text(
                            "Womenswear",
                          )
                        ],

                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(activeColor: Colors.brown,value: "Menswear", groupValue: _selectedGender, onChanged: (value){
                            setState(() {
                              _selectedGender = value;
                            });
                          }),
                          Text(
                            "Menswear",
                          )
                        ],

                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: show_prefested_email_option ? Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 2)
                          ),
                        ]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Contact prefested in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Tell us which email you'd like:",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                ),
                              ],

                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  show_prefested_email_option = false;
                                });
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.pink,
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 13),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discounts and sales",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            Checkbox(activeColor:Colors.brown ,value: discountsSelected, onChanged: (val){
                              setState(() {
                                discountsSelected = val ?? false;
                              });
                            })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New stuff",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            Checkbox(activeColor:Colors.brown,value: newStaffSelected, onChanged: (val){
                              setState(() {
                                newStaffSelected = val ?? false;
                              });
                            })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your exclusives",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            Checkbox(activeColor:Colors.brown,value: exclusivesSelected, onChanged: (val){
                              setState(() {
                                exclusivesSelected = val ?? false;
                              });
                            })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "App partners",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            Checkbox(activeColor:Colors.brown,value: partnersSelected, onChanged: (val){
                              setState(() {
                                partnersSelected = val ?? false;
                              });
                            })
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Tell me more about these",
                          style: TextStyle(color:Colors.grey),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "By creating your account, you agree to our",
                          style: TextStyle(color:Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Terms and Conditions & Privacy Policy",
                          style: TextStyle(color:Colors.brown,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ) ,
                  ):null,
                ),
                SizedBox(height: 160,),
                Padding(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: can_signUP ? handle_signup : null,
                        child: SizedBox(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding:
                          EdgeInsets.symmetric(vertical: 20.0),
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
                ),
                SizedBox(height: 20,),
              ]),
        ),
        padding: EdgeInsets.symmetric(vertical:0 ,horizontal: 16),
      ),
    );
  }
}