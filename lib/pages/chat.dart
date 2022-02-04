import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';


class Chatapp extends StatefulWidget {
  @override
  _ChatappState createState() => _ChatappState();
}

class _ChatappState extends State<Chatapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Container(
      //   color: Colors.white,
      // ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouritePage()));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Image(
                    image: AssetImage('assets/camera_ic.png'),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _showMyDialog();
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: const Image(
                    image: AssetImage('assets/mic_ic.png'),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'اكتب رساله',
                      hintStyle: const TextStyle(fontSize: 12),
                      suffixIcon: Image.asset('assets/send_ic.png'),
                      border: InputBorder.none),
                ),
              ),
            ),
            FocusedMenuHolder(
              menuWidth: MediaQuery.of(context).size.width * 0.50,
              blurSize: 5.0,
              menuItemExtent: 45,
              menuBoxDecoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              duration: const Duration(milliseconds: 100),
              animateMenuItems: true,

              blurBackgroundColor: Colors.black54,
              openWithTap:
                  true, // Open Focused-Menu on Tap rather than Long Press
              menuOffset:
                  10.0, // Offset value to show menuItem from the selected item
              bottomOffsetHeight:
                  10.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
              menuItems: <FocusedMenuItem>[
                // Add Each FocusedMenuItem  for Menu Options
                FocusedMenuItem(
                    title: const Text("الغاء الطلب"),
                    trailingIcon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xff990000),
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenTwo()));
                    }),
                FocusedMenuItem(
                    title: const Text("رفع شكوى"),
                    trailingIcon: const Icon(
                      Icons.message_rounded,
                      color: Color(0xff990000),
                    ),
                    onPressed: () {}),
                FocusedMenuItem(
                    title: const Text("تغير فاتورة"),
                    trailingIcon: const Icon(
                      Icons.change_circle_outlined,
                      color: Color(0xff990000),
                    ),
                    onPressed: () {}),
              ],
              onPressed: () {},
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Image(
                    image: AssetImage('assets/options_ic.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset(
                'assets/mac.png',
                height: 50,
              ),
              const Text(
                'ماكدونالدز',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 15, left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 3),
                                            child: const Icon(
                                              Icons.location_on,
                                              color: Color(0xffA20000),
                                              size: 20,
                                            )),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/phone-call.png'),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              //  Navigator.push(
                                              //     context, MaterialPageRoute(builder: (ctx) => LocationMapPage()));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  color: const Color(0xffEF0000)),
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                  gradient: const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color(0xff00FF77),
                                                        Color(0xff2F00B4),
                                                      ]),
                                                  // color: Color(0xff6A007D),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'تم السداد',
                                                    textAlign:
                                                        TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Column(children: [
                                          const Text(
                                            "تم الدفع",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xff009688)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            child: const Image(
                                              image: AssetImage(
                                                  'assets/paymentm.png'),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "محمد",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '4.6',
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 12),
                                              ),
                                              RatingBar.builder(
                                                initialRating: 3,
                                                itemSize: 10,
                                                minRating: 1,
                                                unratedColor:
                                                    Colors.grey[300],
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.red,
                              // backgroundImage: AssetImage('assets/profile_thumb.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showMyDialog() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  children: [
                      const Text(
                      'هل انت متاكد من تسليم الطلب؟',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       InkWell(
                          onTap: () {
                            //  Navigator.push(
                            // context, MaterialPageRoute(builder: (ctx) => DukanPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffEF0000)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEF0000),
                                      Colors.purple,
                                    ]),
                                color: const Color(0xff6A007D),
                              ),
                              child: const Text(
                                'لا',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                    const SizedBox(width: 20,),
                      InkWell(
                          onTap: () {
                             Navigator.push(
                            context, MaterialPageRoute(builder: (ctx) => _showMyDialog1()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffEF0000)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEF0000),
                                      Colors.purple,
                                    ]),
                                color: const Color(0xff6A007D),
                              ),
                              child: const Text(
                                'تم',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                    ])
                  ],
                ),
              ),
            ));
      },
    );
  }

  _showMyDialog1() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  children: [
                    const Text(
                      'كيف كانت تجربتك',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'محمد',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      itemSize: 18,
                      minRating: 1,
                      unratedColor: Colors.grey[300],
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                          border: Border.all( color: const Color(0xff990000),),
                        ),
                        child: const TextField(
                          maxLength: 8,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '.... اكتب تقيمك ( اختياري )',
                              hintStyle: TextStyle(fontSize: 12)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text(
                      'ليس الان',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15,  color: Color(0xff990000),fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20,),
                      InkWell(
                          onTap: () {
                            //  Navigator.push(
                            // context, MaterialPageRoute(builder: (ctx) => DukanPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffEF0000)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEF0000),
                                      Colors.purple,
                                    ]),
                                color: const Color(0xff6A007D),
                              ),
                              child: const Text(
                                'تم',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )),
                    ])
                  ],
                ),
              ),
            ));
      },
    );
  }
}
