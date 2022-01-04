import 'package:deliveryadmin/admin/addproduct.dart';
import 'package:flutter/material.dart';



class AdminWelcome extends StatefulWidget {
  @override
  _AdminWelcomeState createState() => _AdminWelcomeState();
}

class _AdminWelcomeState extends State<AdminWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
       
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
        
              
            Image.asset('assets/largelogo.png'),
          SizedBox(
            height: 80,
          ),
          Text(
            'اهلا وسهلا بك',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff28476E),
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            'انقر للبداية',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff28476E),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => AddProduct()));
              },
              child: Image.asset('assets/tap.png')),
          SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
