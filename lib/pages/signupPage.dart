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
  bool discountsSelected = false;
  bool newStaffSelected = false;
  bool exclusivesSelected = false;
  bool partnersSelected = false;

  String? _selectedGender;

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
            "Must be 10 or more characters",
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey
            ),
          ),
              SizedBox(height: 20,),

              Row(
                children: [
                  Padding(
                    child:                   Text(
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
                        Radio<String>(value: "Womenswear", groupValue: _selectedGender, onChanged: (value){
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
                        Radio<String>(value: "Menswear", groupValue: _selectedGender, onChanged: (value){
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
              
              Center(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Contract prefested in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.close_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ]),
        padding: EdgeInsets.symmetric(vertical:0 ,horizontal: 16),
      ),
    );
  }
}