import 'package:flutter/material.dart';

import 'otp.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController inputcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(15, 50, 15, 30),
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
                      'هل نسيت كلمة السر',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff28476E),
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
                        'أدخل رقم هاتفك أدناه وسنرسل إليك رسالة نصية تحتوي على رمز التحقق لتغيير كلمة المرور الخاصة بك',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff28476E),
                        ),
                      )),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(
                    left: 30, right: 30, top: 150, bottom: 50),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff28476E),
                      width: 1,
                    ),
                  ),
                ),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: inputcontroller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'رقم الهاتف',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xff28476E),
                      ),
                      border: InputBorder.none,
                    )),
              ),
              SizedBox(
                height: 200,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => OTP()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 70),
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
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
