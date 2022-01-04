import 'package:deliveryadmin/admin/phoneNo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isMale = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(15, 40, 15, 30),
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
                height: 10,
              ),
              Text(
                'مستخدم جديد',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff28476E),
                              width: 1,
                            ),
                          ),
                        ),
                        child: TextFormField(
                            controller: lastName,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'الاسم الاخير',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff28476E),
                              width: 1,
                            ),
                          ),
                        ),
                        child: TextFormField(
                            controller: firstName,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'الاسم الأول',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xff28476E),
                              ),
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 130, top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff28476E),
                      width: 1,
                    ),
                  ),
                ),
                child: TextFormField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'اسم المستخدم',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xff28476E),
                      ),
                      border: InputBorder.none,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff28476E),
                      width: 1,
                    ),
                  ),
                ),
                child: TextFormField(
                    controller: email,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'الايميل',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xff28476E),
                      ),
                      border: InputBorder.none,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 130, top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff28476E),
                      width: 1,
                    ),
                  ),
                ),
                child: TextFormField(
                    controller: password,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'كلمة السر',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xff28476E),
                      ),
                      border: InputBorder.none,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff28476E),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '+966',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff28476E)),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneNumber,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'رقم الهاتف',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xff28476E),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff28476E),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMale = !isMale;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Center(
                          // انثى text
                          child: Text(
                            'انثى',
                            style: TextStyle(
                                color: isMale == false
                                    ? Color(0xff28476E)
                                    : Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'JF Flat',
                                fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.symmetric(vertical: 10),
                      child: VerticalDivider(
                        width: 30,
                        thickness: 2,
                        color: Color(0xff28476E),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = !isMale;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Center(
                          child: Text(
                            'ذكر',
                            style: TextStyle(
                                color: isMale == true
                                    ? Color(0xff28476E)
                                    : Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'JF Flat',
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => PhoneNumber()));
                },
                child: isLoading == false
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'تسجيل',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
