import 'package:deliveryadmin/admin/phoneNo.dart';
import 'package:deliveryadmin/admin/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBEEFB),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(15, 10, 15, 30),
         
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'تسجيل الدخول',
                style: TextStyle(fontSize: 25,color:Color(0xff28476E)),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: Colors.black54,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: '05xxxxxxx',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 18)),
                        ),
                      ),
                      Text(
                        'رقم الجوال',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Image(
                          image: AssetImage('assets/NoPath - Copy (2).png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: Colors.black54,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: '06xxxxxxx',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 20)),
                        ),
                      ),
                      Text(
                        'كلمة المرور',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Center(
                        child: Image(
                          image: AssetImage('assets/NoPath - Copy (4).png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => SignUp()));
                      },
                      child: Text(
                        'ليس لديك حساب ؟ اشتراك',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'سيت كلمة المرور؟',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => PhoneNumber()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                           
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'اشتراك',
                            style: TextStyle(
                                fontSize: 16,
                                 
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: InkWell(
                        // onTap: () {
                        //   Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HomePage()));
                        // },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                             
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              'دخول',
                              style: TextStyle(
                                  fontSize: 16,
                                  
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
             
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                width: 200,
                  // margin: EdgeInsets.symmetric(horizontal: 70),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/black-apple-icon.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Apple المتابعة مع',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
               
                child: 
                    Card(
                        elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                      child: Container(
                   width: 200,
                          padding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/google-play-2-555322.png'),
                                height: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Google Play',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                    )
                  
              ),
              Card(
                  elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                 width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/Huawei-logo-white-1.png'),
                        height: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Huawei  المتابعة مع',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 80),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                             color:Color(0xff28476E),
                              borderRadius: BorderRadius.circular(30),
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/hand.png'),
                              SizedBox(width: 20,),
                              Text(
                                'مزود الخدمة',
                                style: TextStyle(
                                    fontSize: 16,
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
