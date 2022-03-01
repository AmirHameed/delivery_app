import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/constant.dart';
import 'package:truckdelivery/controller/setting_controller.dart';
import 'package:truckdelivery/helper/firestore_database_helper.dart';
import 'package:truckdelivery/helper/get_storage_helper.dart';
import 'package:truckdelivery/model/chat.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:truckdelivery/pages/bottomAppbar.dart';
import 'package:truckdelivery/pages/map.dart';
import 'package:url_launcher/url_launcher.dart';

class Chatapp extends StatefulWidget {
  final int index;

  Chatapp({required this.index});

  @override
  _ChatappState createState() => _ChatappState();
}

class _ChatappState extends State<Chatapp> {
  late String groupId;
  final TextEditingController messageFieldTextController = TextEditingController();
  final GetStorageHelper getStorageHelper = GetStorageHelper.instance;
  final FirestoreDatabaseHelper _firestoreDatabaseHelper = FirestoreDatabaseHelper.instance;
  SettingController orderController = Get.find();
  num reviwesValue = 0;
  Stream<QuerySnapshot<Map<String, dynamic>>>? _stream;
  final List<Chat> _chat = <Chat>[];

  @override
  void initState() {
    getGroupId();
    myMessages();
    super.initState();
  }

  Future<void> getGroupId() async {
    final user = await getStorageHelper.user();
    if (user == null) return;
    groupId = user.id.hashCode <= orderController.order[widget.index].creatorId.id.hashCode
        ? '${user.id}-${orderController.order[widget.index].creatorId.id}'
        : '${orderController.order[widget.index].creatorId.id}-${user.id}';
  }

  Future<void> sendMessage(String content) async {
    messageFieldTextController.text = '';
    final user = await getStorageHelper.user();
    if (user == null) return;
    final Chat chat = Chat.withoutId(
        chatId: groupId,
        senderId: user.id.toString(),
        receiverId: orderController.order[widget.index].creatorId.id,
        senderImageUrl: user.image,
        receiverImageUrl: orderController.order[widget.index].creatorId.yourImage,
        senderName: user.firstName + " " + user.lastName,
        receiverName: orderController.order[widget.index].creatorId.firstName +
            " " +
            orderController.order[widget.index].creatorId.lastName,
        content: content);
    try {
      await _firestoreDatabaseHelper.sendMessage(chat);
      //lastSentMessage = MapEntry(content, DateTime.now());
      //_sharedWebService.sendNotification(receiver: friendModel.id, msg: content, title: user.name,source: 'chat');
    } catch (_) {}
  }

  Future<void> myMessages() async {
    final user = await getStorageHelper.user();
    if (user == null) return;
    _stream = null;
    _stream = _firestoreDatabaseHelper.myMessage(groupId);
    _stream?.listen((event) {
      final docs = event.docChanges;
      final messages = docs
          .where((element) => element.doc.data() != null && element.doc.data()!['time_stamp'] != null)
          .map((e) => Chat.fromJson(e.doc.data()!, e.doc.id))
          .where((element) => !_chat.contains(element))
          .toList();

      _chat.isEmpty ? _chat.addAll(messages) : _chat.insertAll(0, messages);
      setState(() {});
    }, onError: (e, s) {
      print(e);
      print(s);
      print("onError");
    });
  }

  var listServiceType = [
    'موقع الإستلام',
    'وصلت الموقع',
    'تم التسليم',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orderController.order[widget.index].completed == true ? Colors.black.withOpacity(0.2) : Colors.white,
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Image(
                    image: AssetImage('assets/camera_ic.png'),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: const Image(
                  image: AssetImage('assets/mic_ic.png'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextFormField(
                  controller: messageFieldTextController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'اكتب رساله',
                      hintStyle: const TextStyle(fontSize: 12),
                      suffixIcon: IconButton(
                          onPressed: () {
                            final String text = messageFieldTextController.text;
                            if (text.isEmpty) return;
                            sendMessage(text);
                          },
                          icon: Image.asset('assets/send_ic.png')),
                      border: InputBorder.none),
                ),
              ),
            ),
            FocusedMenuHolder(
              menuWidth: MediaQuery.of(context).size.width * 0.50,
              blurSize: 5.0,
              menuItemExtent: 45,
              menuBoxDecoration: const BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(15.0))),
              duration: const Duration(milliseconds: 100),
              animateMenuItems: true,

              blurBackgroundColor: Colors.black54,
              openWithTap: true,
              // Open Focused-Menu on Tap rather than Long Press
              menuOffset: 10.0,
              // Offset value to show menuItem from the selected item
              bottomOffsetHeight: 10.0,
              // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
              menuItems: <FocusedMenuItem>[
                // Add Each FocusedMenuItem  for Menu Options
                FocusedMenuItem(
                    title: const Text("الغاء الطلب"),
                    trailingIcon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xff990000),
                    ),
                    onPressed: () {
                    orderController.orderStatusCancel(orderController.order[widget.index].id);
                    orderController.order.clear();
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => BottomApp()));
                    });
                    }),
                // FocusedMenuItem(
                //     title: const Text("رفع شكوى"),
                //     trailingIcon: const Icon(
                //       Icons.message_rounded,
                //       color: Color(0xff990000),
                //     ),
                //     onPressed: () {}),
                // FocusedMenuItem(
                //     title: const Text("تغير فاتورة"),
                //     trailingIcon: const Icon(
                //       Icons.change_circle_outlined,
                //       color: Color(0xff990000),
                //     ),
                //     onPressed: () {}),
              ],
              onPressed: () {},
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 50,
                    ),
                    const Text(
                      'ماكدونالدز',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GetBuilder<SettingController>(builder: (value) {
                      print(value.order.first.prize);
                      String serviceType = value.order[0].orderStatus;
                      return Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: orderController.order[0].completed == true ? Colors.grey.withOpacity(0.5) : Colors.white,
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              elevation: 8,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding: const EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: serviceType == 'موقع الإستلام'
                                              ? orderStatus1Color
                                              : serviceType == 'وصلت الموقع'
                                                  ? orderStatus2Color
                                                  : orderStatus3Color),
                                      width: MediaQuery.of(context).size.width / 2,
                                      height: 40,
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Text(
                                          serviceType,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (ctx) => MapLocationScreen(
                                                                      index: 0,
                                                                    )));
                                                      },
                                                      child: Container(
                                                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                                          child: const Icon(
                                                            Icons.location_on,
                                                            color: Color(0xffA20000),
                                                            size: 20,
                                                          )),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        _makePhoneCall(value.order[widget.index].creatorId.phone);
                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                                        child: const Image(
                                                          image: AssetImage('assets/phone-call.png'),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(children: [
                                                      const Text(
                                                        "تم الدفع",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(fontSize: 10, color: Color(0xff009688)),
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                        child: const Image(
                                                          image: AssetImage('assets/paymentm.png'),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    value.order[widget.index].creatorId.firstName,
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
                                                            '${(value.order[widget.index].creatorId.reviews / value.order[widget.index].creatorId.totalCount).isNaN ? 0 : (value.order[widget.index].creatorId.reviews / value.order[widget.index].creatorId.totalCount).toPrecision(2)}',
                                                            style: TextStyle(color: Colors.grey[400], fontSize: 12),
                                                          ),
                                                          RatingBarIndicator(
                                                            rating: (value.order[widget.index].creatorId.reviews /
                                                                        value.order[widget.index].creatorId.totalCount)
                                                                    .isNaN
                                                                ? 0
                                                                : (value.order[widget.index].creatorId.reviews /
                                                                        value.order[widget.index].creatorId.totalCount)
                                                                    .toPrecision(2),
                                                            itemBuilder: (context, index) => Icon(
                                                              Icons.star,
                                                              color: Colors.amber,
                                                            ),
                                                            itemCount: 5,
                                                            itemSize: 15,
                                                            unratedColor: Colors.black12,
                                                            direction: Axis.horizontal,
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
                                        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                              image: value.order[widget.index].creatorId.yourImage.isNotEmpty
                                                  ? DecorationImage(
                                                      image: NetworkImage(value.order[widget.index].creatorId.yourImage),
                                                      fit: BoxFit.cover)
                                                  : null),
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    Expanded(
                      child: ListView.separated(
                          reverse: true,
                          itemCount: _chat.length,
                          padding: const EdgeInsets.only(bottom: 65),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => const SizedBox(height: 5),
                          itemBuilder: (_, index) {
                            print(_chat);
                            print('orders=====>${orderController.order[widget.index].orderStatus}');
                            final item = _chat[index];
                            return MessageBox(chat: item, userId: orderController.userModel!.id);
                          }),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: GetBuilder<SettingController>(
                    builder: (value) => value.order[widget.index].completed == true
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.37,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                              child: GetBuilder<SettingController>(
                                builder: (value) => Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'كيف كانت تجربتك',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        value.order[widget.index].creatorId.firstName,
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      RatingBar.builder(
                                        initialRating: (orderController.order[widget.index].creatorId.reviews) /
                                            (orderController.order[0].creatorId.totalCount),
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
                                          print('rating$rating');
                                          reviwesValue = rating;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            border: Border.all(
                                              color: blueColor,
                                            ),
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
                                        height: 10,
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                        GestureDetector(
                                          onTap: () {
                                            Future.delayed(const Duration(milliseconds: 500), () {
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomApp()));
                                            });
                                          },
                                          child: Text(
                                            'ليس الان',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15, color: Color(0xff990000), fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              num privoiusReviews = value.order[0].creatorId.reviews;
                                              num pretotalvalue = value.order[0].creatorId.totalCount;
                                              value.updateReviews(
                                                  value.order[0].creatorId.id, privoiusReviews + reviwesValue, pretotalvalue + 1);
                                              value.order.clear();
                                              Future.delayed(const Duration(milliseconds: 500), () {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(builder: (_) => BottomApp()));
                                              });
                                            },
                                            child: GestureDetector(
                                              onTap: (){
                                                value.order.clear();
                                                Future.delayed(const Duration(milliseconds: 500), () {
                                                  Navigator.pushReplacement(
                                                      context, MaterialPageRoute(builder: (_) => BottomApp()));
                                                });
                                              },
                                              child: Container(
                                                decoration:
                                                    BoxDecoration(borderRadius: BorderRadius.circular(30), color: blueColor),
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: blueColor,
                                                  ),
                                                  child: const Text(
                                                    'تم',
                                                    style:
                                                        TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ])
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }
}

class MessageBox extends StatelessWidget {
  final Chat chat;
  final String userId;

  const MessageBox({required this.chat, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: chat.senderId == userId ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          chat.senderId == userId
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: chat.senderId == userId ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: (chat.senderId == userId ? Alignment.topRight : Alignment.topLeft),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                  color: (chat.senderId == userId ? yourChatColor : myChatColor),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(chat.content,
                                        softWrap: true, maxLines: null, style: TextStyle(fontSize: 15, color: Colors.white)),
                                    Text(
                                      timeago.format(chat.timeStamp),
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: blueColor),
                      image: chat.senderImageUrl.isNotEmpty
                          ? DecorationImage(image: CachedNetworkImageProvider(chat.senderImageUrl), fit: BoxFit.cover)
                          : const DecorationImage(image: AssetImage('assets/empty_image.png'), fit: BoxFit.cover))),
          chat.senderId == userId
              ? Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: blueColor),
                      image: chat.senderImageUrl.isNotEmpty
                          ? DecorationImage(image: CachedNetworkImageProvider(chat.senderImageUrl), fit: BoxFit.cover)
                          : const DecorationImage(image: AssetImage('assets/empty_image.png'), fit: BoxFit.cover)))
              : Expanded(
                  child: Column(
                    crossAxisAlignment: chat.senderId == userId ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: (chat.senderId == userId ? Alignment.topRight : Alignment.topLeft),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                  color: (chat.senderId == userId ? yourChatColor : myChatColor),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      chat.content,
                                      softWrap: true,
                                      maxLines: null,
                                      style:
                                          TextStyle(fontSize: 15, color: chat.senderId == userId ? lightblueColor : Colors.white),
                                    ),
                                    Text(
                                      timeago.format(chat.timeStamp),
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
