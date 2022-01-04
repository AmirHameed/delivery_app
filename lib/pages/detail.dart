import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                    EdgeInsets.only( right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'سطحة عادية',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff28476E),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 100),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ريال',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ابتداء من',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset('assets/speed.png'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 60),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ريال',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'دقيقة',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset('assets/Time.png'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ريال',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'كيلومتر',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset('assets/clock.png'),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff99DEF8),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'عنوان التحميل',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xff28476E),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff28476E),
                                  radius: 8,
                                  child: CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xff28476E),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'عنوان التسليم',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Image.asset('assets/location.png')),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'طريقة الدفع',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff28476E),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'بطاقة ائتمانية',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 12,
                                    ),
                                  ),
                                   Image.asset('assets/wallet.png')
                                ],
                              ),
                              Column(
                               
                                children: [
                                  Text(
                                    'الدفع كاش',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontSize: 12,
                                    ),
                                  ),
                                   Image.asset('assets/cash.png')
                                ],
                              ),
                            ],
                          ),
                        ),
                          SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'عندك أي ملاحظات؟',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff28476E),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                             SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                spreadRadius:2,
                                blurRadius: 2,
                                color: Colors.black12,
                              )
                            ]
                          ),
                        ),
                         SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'اضف صورة السيارة',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff28476E),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                           SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                              color: Colors.white,
                              child: Image.asset('assets/camera.png')),
                          ],
                        ),
                            SizedBox(
                          height: 20,
                        ),
                          InkWell(
                          onTap: () {
                           
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left:20.0,right:20),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                              child: Container(
                               
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xff99DEF8),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                                child: Center(
                                  child: Text('اطلب الان',
                                      style: TextStyle(
                                        color: Color(0xff28476E),
                                        fontSize: 18,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                           SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
              top: 40,
              child: Center(
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Positioned(
              left: 15,
              top: 40,
              child: Center(
                child: Image.asset('assets/backButton.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }


  
}
