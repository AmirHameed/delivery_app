import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckdelivery/constant.dart';
import 'package:truckdelivery/controller/setting_controller.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';
import 'package:truckdelivery/pages/chat.dart';

class OrderRequest extends StatefulWidget {
  @override
  _OrderRequestState createState() => _OrderRequestState();
}

class _OrderRequestState extends State<OrderRequest> {
  SettingController _ = Get.find();
  final ImagePicker imagePicker = ImagePicker();

  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);

    return Scaffold(
      backgroundColor: Color(0xff99DEF8),
      body: GetBuilder<SettingController>(
        builder: (value) => Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.5)),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // InkWell(
                              //     onTap: () {
                              //       Navigator.pop(context);
                              //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>BottomApp()));
                              //     },
                              //     child: Image.asset('assets/backButton.png')),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    'طلباتي',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff28476E),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: value.order.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 10, right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      value.updateOrderRequest(value.order[index].id);

                                                      final snackbar = SnackbarHelper.instance..injectContext(context);
                                                      snackbar.showSnackbar(
                                                          snackbar: SnackbarMessage.success(message: 'طلب القبول'));
                                                      return;
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                      decoration: BoxDecoration(
                                                        color: lightblueColor,
                                                        borderRadius: BorderRadius.circular(5),
                                                        border: Border.all(
                                                          color: blueColor,
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'قبول',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'رفض',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        value.order[index].creatorId.firstName,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          const Text(
                                                            '4.5',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(0xff878787),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          RatingBar.builder(
                                                            itemSize: 12,
                                                            initialRating: 3,
                                                            minRating: 1,
                                                            direction: Axis.horizontal,
                                                            unratedColor: Colors.grey[300],
                                                            allowHalfRating: true,
                                                            itemCount: 5,
                                                            itemBuilder: (context, _) => const Icon(
                                                              Icons.star,
                                                              color: Colors.amber,
                                                            ),
                                                            onRatingUpdate: (rating) {},
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    width: 45,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        shape: BoxShape.circle,
                                                        image: value.order[index].creatorId.yourImage.isNotEmpty
                                                            ? DecorationImage(
                                                                image: NetworkImage(value.order[index].creatorId.yourImage),
                                                                fit: BoxFit.cover)
                                                            : null),
                                                    alignment: Alignment.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                            margin: EdgeInsets.only(right: 20),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(
                                                color: blueColor,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                value.order[index].prize,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: blueColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ])
                                      ],
                                    ),
                                  ),
                                );
                              }),
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
            ],
          ),
        ),
      ),
    );
  }
}

class TimerClass extends StatefulWidget {
  String parcelId;

  TimerClass({required this.parcelId});

  @override
  _TimerClassState createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
  SettingController _settingController = Get.find();
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 120;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout() {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        if (_settingController.order.isNotEmpty) {
          timer.cancel();
        }
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    _settingController.getOrders(widget.parcelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                      Center(
                        child: buildTimer(),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "تم إرسال طلبك للمندوبين",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        "الرجاء الانتظار حتى حتى يقوم أحد المناديب بقبول طلبك",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "شكرا",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              _settingController.order.isNotEmpty
                  ? Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Container(
                          child: GetBuilder<SettingController>(
                            builder: (value) => ListView.builder(
                                shrinkWrap: true,
                                itemCount: value.order.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 10, right: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        value.updateOrderRequest(value.order[index].id);
                                                        // final snackbar = SnackbarHelper.instance..injectContext(context);
                                                        // snackbar.showSnackbar(snackbar: SnackbarMessage.success(message: 'طلب القبول'));
                                                        // return;
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (ctx) => Chatapp(
                                                                      index: index,
                                                                    )));
                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                        decoration: BoxDecoration(
                                                          color: lightblueColor,
                                                          borderRadius: BorderRadius.circular(5),
                                                          border: Border.all(
                                                            color: blueColor,
                                                          ),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'قبول',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'رفض',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.grey,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          value.order[index].creatorId.firstName,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            const Text(
                                                              '4.5',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Color(0xff878787),
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                            RatingBar.builder(
                                                              itemSize: 12,
                                                              initialRating: 3,
                                                              minRating: 1,
                                                              direction: Axis.horizontal,
                                                              unratedColor: Colors.grey[300],
                                                              allowHalfRating: true,
                                                              itemCount: 5,
                                                              itemBuilder: (context, _) => const Icon(
                                                                Icons.star,
                                                                color: Colors.amber,
                                                              ),
                                                              onRatingUpdate: (rating) {},
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 45,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          shape: BoxShape.circle,
                                                          image: value.order[index].creatorId.yourImage.isNotEmpty
                                                              ? DecorationImage(
                                                                  image: NetworkImage(value.order[index].creatorId.yourImage),
                                                                  fit: BoxFit.cover)
                                                              : null),
                                                      alignment: Alignment.center,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                                              margin: EdgeInsets.only(right: 20),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: blueColor,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(' قيمة العرض : ريال '+'${value.order[index].prize}',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: blueColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ])
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          )),
    );
  }

  // showAlertDialog(BuildContext context) {
  //
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Text("OK"),
  //     onPressed: () { },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("My title"),
  //     content: Text("This is my message."),
  //     actions: [
  //       okButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  Widget buildTimer() => SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: currentSeconds / timerMaxSeconds,
              valueColor: const AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 6,
              backgroundColor: blueColor,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Icon(Icons.timer),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    timerText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
