import 'package:flutter/material.dart';

import 'adminlogin.dart';


class OTP extends StatefulWidget {
  
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 15,right: 15,top: 30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/forward.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff28476E),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'التحقق من رقم الهاتف',
                        style: TextStyle(
                            color: Color(0xff28476E),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                          child: Text(
                        '. أدخل الرقم المرسل لرقم هاتفك',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Color(0xff28476E),
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.next,
                           
                            controller: one,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                               textInputAction: TextInputAction.next,
                          
                            controller: two,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                               textInputAction: TextInputAction.next,
                         
                            controller: three,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                               textInputAction: TextInputAction.next,
                         
                            controller: four,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                               textInputAction: TextInputAction.next,
                          
                            controller: five,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff28476E),
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                               textInputAction: TextInputAction.next,
                            
                            controller: six,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 170,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => AdminLogin()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 70, vertical: 130),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                    child: Center(
                      child: Text(
                        'ارسال',
                        style: TextStyle(
                            fontSize: 16,
                         
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
