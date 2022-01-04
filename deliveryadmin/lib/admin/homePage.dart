import 'package:deliveryadmin/admin/allinOne.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageList = [
    'assets/slider1.png',
    'assets/slider2.png',
  ];
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
                padding:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/mic.png'),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'الدعم',
                              textAlign: TextAlign.right,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 40),
                              margin: EdgeInsets.only(left: 40),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff99DEF8),
                                    ),
                                    child: Text(
                                      'ابحث',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.search),
                                ),
                              )),
                          Positioned(
                            left: 25,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xffAD122A),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Swiper(
                            itemCount: imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Image(
                                image: AssetImage(imageList[index]),
                                fit: BoxFit.fill,
                              );
                            },
                            layout: SwiperLayout.DEFAULT,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PaymentMethod()));
                                  },
                                  child: myContainer(
                                      'للايجار', 'assets/home1.png'),
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Delivery()));
                                  },
                                  child: myContainer(
                                      'أصحاب العقار', 'assets/home2.png'),
                                )),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                    child: myContainer(
                                        'للتقبيل', 'assets/home3.png')),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Shifting()));
                                  },
                                  child:
                                      myContainer('للبيع', 'assets/home4.png'),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        padding: EdgeInsets.only(
                          bottom: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    'ارسل طلبك',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff28476E),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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
                                          builder: (ctx) => Home1()));
                                },
                                child: Image.asset('assets/docs.png'))
                          ],
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
                  'assets/smalllogo.png',
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myContainer(String text, image) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 100,
        top: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff28476E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
