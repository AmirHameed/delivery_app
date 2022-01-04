import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OptionPage extends StatefulWidget {
  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffACE0F3),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 35,
                              color: Color(0xff28476E),
                            ))
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'مرحبا بك',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Image.asset('assets/gallery.png'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset('assets/edit.png'),
                                        ]),
                                        Row(
                                          children: [
                                            Text(
                                              'محمد احمد',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'الاسم ',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])
                                ]),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 50,
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 31,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                     myContainer('الدفع', 'assets/balance.png'),
                        SizedBox(
                        height: 5,
                      ),
                     myContainer('تواصل معنا', 'assets/phone.png'),
                       SizedBox(
                        height: 5,
                      ),
                     myContainer('الاعدادات', 'assets/setting.png'),
                       SizedBox(
                        height: 10,
                      ),
                     myContainer('مشاركة التطبيق', 'assets/sharing.png'),
                       SizedBox(
                        height: 5,
                      ),
                     myContainer('اللغة', 'assets/browsing.png'),
                       SizedBox(
                        height: 60,
                      ),
                      Image.asset('assets/logout.png'),
                      Text(
                                  'تسجل الخروج',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 18,
                                    ),
                                  ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Center(
                child: Image.asset(
                  'assets/smallestate.png',
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myContainer(String text,image) {
    return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xff99DEF8),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                   text,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Image.asset(image),
                                ])),
                      );
  }
}
