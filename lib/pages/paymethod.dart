import 'package:flutter/material.dart';
import 'package:truckdelivery/pages/tafseel.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  var pay = false;
  var mada = false;
  var stcpay = false;
  var kasah = true;
  var visa = false;
  var mcart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
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
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset('assets/backButton.png')),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'بيانات الطلب ',
                          style: TextStyle(
                            color: Color(0xff28476E),
                            fontSize: 20,
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
                                      vertical: 5, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'بيانات الطلب ',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Thulaim Riyadh Saudi Arabia  24.638888,46.719762 ',
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff28476E),
                                  radius: 10,
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
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
                                      vertical: 5, horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'بيانات الطلب ',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Thulaim Riyadh Saudi Arabia  24.638888,46.719762 ',
                                              style: TextStyle(
                                                color: Color(0xff28476E),
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              Expanded(
                                  child: Image.asset('assets/location.png')),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage('assets/located.png'),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(top: 150),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.only(
                                //   topLeft: Radius.circular(20),
                                //   topRight: Radius.circular(20),
                                // ),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color(0xff28476E),
                                      Colors.white10
                                    ]),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'ريال',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '17',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'قيمة التوصيل',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                // width: MediaQuery.of(context).size.width*0.4,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'assets/method1.png',
                                      height: 15,
                                    ),
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        value: pay,
                                        onChanged: (value) {
                                          setState(() {
                                            pay = value!;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                // width: MediaQuery.of(context).size.width*0.4,
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/method2.png',
                                      height: 20,
                                    ),
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        tristate: true,
                                        value: kasah,
                                        onChanged: (value) {
                                          setState(() {
                                            kasah = value!;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                // width: MediaQuery.of(context).size.width*0.4,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'كاش',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xffF9B506),
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Image.asset(
                                      'assets/method3.png',
                                      height: 12,
                                    ),
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        // tristate: true,
                                        value: mada,
                                        onChanged: (value) {
                                          setState(() {
                                            mada = value!;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.011,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                // width: MediaQuery.of(context).size.width*0.4,
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    Image.asset('assets/method4.png'),
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        // tristate: true,
                                        value: stcpay,
                                        onChanged: (value) {
                                          setState(() {
                                            stcpay = value!;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                // width: MediaQuery.of(context).size.width*0.4,
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    Image.asset('assets/method5.png'),
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        // tristate: true,
                                        value: visa,
                                        onChanged: (value) {
                                          setState(() {
                                            visa = value!;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                // width: MediaQuery.of(context).size.width*0.4,
                                // color: Colors.blue,
                                child: Row(
                                  children: [
                                    Image.asset('assets/method6.png'),
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        // tristate: true,
                                        value: mcart,
                                        onChanged: (value) {
                                          setState(() {
                                            mcart = value!;
                                          });
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'اضف كوبون',
                                    hintStyle:
                                        TextStyle(color: Color(0xffB5B5B5)))),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                        onTap: (){
                          _showMyDialog();
                        },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Color(0xff28476E),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: Center(
                              child: Text('تأكيد الطلب',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Center(
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
   _showMyDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              height: 125,
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  Text(
                    'تم ارســال طلبك بنجــاح',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 InkWell(
                           onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Tasfeel()));

                           },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Color(0xff28476E),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                )),
                            child: Center(
                              child: Text('تأكيد الطلب',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        )
                ],
              ),
            ),);
      },
    );
  }
}
