import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switchControl = false;
  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
      });
    } else {
      setState(() {
        switchControl = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding:
                      EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 20),
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            CircleAvatar(
                              radius: 33,
                               backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 30,
                              ),
                            ),
                            InkWell(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.keyboard_arrow_left_outlined,size: 30)),

                          ]
                        ),
                       
                        Text(
                          'الاعدادات',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff28476E),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 10),
                                  hintText: 'اسم المعلن',
                                  isDense: true,
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff28476E),
                                  ),
                                  prefixIcon:
                                      Image.asset('assets/percentage.png')),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 40),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Transform.scale(
                                              scale: 1.3,
                                              child: Switch(
                                                onChanged: toggleSwitch,
                                                value: switchControl,
                                                activeColor: Colors.white,
                                                activeTrackColor:
                                                    Color(0xff28476E),
                                                inactiveThumbColor:
                                                    Colors.white,
                                                inactiveTrackColor: Colors.blue,
                                              )),
                                          Row(
                                            children: [
                                              Text(
                                                'الاشعارات',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset('assets/notify.png'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Transform.scale(
                                              scale: 1.3,
                                              child: Switch(
                                                onChanged: toggleSwitch,
                                                value: switchControl,
                                                activeColor: Colors.white,
                                                activeTrackColor:
                                                    Color(0xff28476E),
                                                inactiveThumbColor:
                                                    Colors.white,
                                                inactiveTrackColor: Colors.blue,
                                              )),
                                          Row(
                                            children: [
                                              Text(
                                                'الوضع الليلي',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 13,
                                              ),
                                              Image.asset('assets/moon.png'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.keyboard_arrow_left_outlined,
                                            size: 35,
                                            color: Color(0xff28476E),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'مساعدة',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset('assets/alarm.png'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.keyboard_arrow_left_outlined,
                                            size: 35,
                                            color: Color(0xff28476E),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'الشروط والاحكام',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff28476E),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Image.asset(
                                                  'assets/greeting.png'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: -40,
                                child: Center(
                                    child: Image.asset('assets/tick.png')))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'تحديث',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff28476E),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              color: Colors.white,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 45,
              child: Center(
                child: Image.asset(
                  'assets/smalllogo.png',
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
