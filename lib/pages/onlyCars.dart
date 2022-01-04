import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnlyCarDelivery extends StatefulWidget {
  @override
  _OnlyCarDeliveryState createState() => _OnlyCarDeliveryState();
}

class _OnlyCarDeliveryState extends State<OnlyCarDelivery> {
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
                    EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,

                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  //   color: Colors.white.withOpacity(0.5),
                  // ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                              image: AssetImage('assets/header2.png'),
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    size: 40,
                                    color: Color(0xff28476E),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'بيك اب ',
                                    style: TextStyle(
                                        color: Color(0xff28476E), fontSize: 18),
                                  ),
                                ],
                              ),
                              Image.asset('assets/dalla.png'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    size: 40,
                                    color: Color(0xff28476E),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'فان ',
                                    style: TextStyle(
                                        color: Color(0xff28476E), fontSize: 18),
                                  ),
                                ],
                              ),
                              Image.asset('assets/vanWhite.png'),
                            ],
                          ),
                        ),
                         SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    size: 40,
                                    color: Color(0xff28476E),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'ديًنا ',
                                    style: TextStyle(
                                        color: Color(0xff28476E), fontSize: 18),
                                  ),
                                ],
                              ),
                              Image.asset('assets/truckWhite.png'),
                            ],
                          ),
                        ),
                         SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    size: 40,
                                    color: Color(0xff28476E),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'ديًنا مع ثلاجة ',
                                    style: TextStyle(
                                        color: Color(0xff28476E), fontSize: 18),
                                  ),
                                ],
                              ),
                              Image.asset('assets/smallTruck.png'),
                            ],
                          ),
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
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.2),
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
            Positioned(
              top: 40,
              left: 15,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/backButton.png')),
            ),
          ],
        ),
      ),
    );
  }
}
