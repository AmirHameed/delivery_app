import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:truckdelivery/controller/delivery_controller.dart';
import 'package:truckdelivery/pages/detail.dart';
import 'package:truckdelivery/pages/paymethod.dart';

class Delivery extends StatefulWidget {
  final int isOutCity;
  final String carTile;

  Delivery({required this.isOutCity, required this.carTile});

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  DeliveryController deliveryController = Get.put(DeliveryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<DeliveryController>(builder: (_deliveryController) {
          final kInitialPosition =
              LatLng(_deliveryController.position?.latitude ?? 0, _deliveryController.position?.longitude ?? 0);
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: PlacePicker(
                  apiKey: 'AIzaSyDw5sFwN-NTYcw4C09-seRd1o-W2Jm9ER0',
                  initialPosition: kInitialPosition,
                  useCurrentLocation: true,
                  selectInitialPosition: true,
                  usePlaceDetailSearch: true,
                  onPlacePicked: (result) {
                    _deliveryController.isCheckedPick == true
                        ? _deliveryController.pickselectedPlace = result
                        : _deliveryController.dropselectedPlace = result;
                    print('ddsdsdsd=>$result');
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  forceSearchOnZoomChanged: true,
                  automaticallyImplyAppBarLeading: false,
                  // autocompleteLanguage: "ko",
                  // region: 'au',
                  selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                    print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                    _deliveryController.isCheckedPick == true
                        ? _deliveryController.pickselectedPlace = selectedPlace
                        : _deliveryController.dropselectedPlace = selectedPlace;
                    print('ddsdsdsd hhh=>${selectedPlace!.name}');

                    return isSearchBarFocused
                        ? Container()
                        : FloatingCard(
                            bottomPosition: 10.0,
                            // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                            leftPosition: 20.0,
                            rightPosition: 20.0,
                            width: 400,
                            borderRadius: BorderRadius.circular(12.0),
                            child: state == SearchingState.Searching
                                ? Center(child: CircularProgressIndicator())
                                : Container(
                                    child: Column(children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        decoration: BoxDecoration(
                                            color: Color(0xffE3F3F9),
                                            borderRadius:
                                                BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                _deliveryController.isCheckedPick == true
                                                    ? 'مكان استلام الطرد'
                                                    : 'مكان تسليم الطرد',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(color: Color(0xff28476E), fontSize: 25),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.white,
                                            thickness: 2,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${selectedPlace?.formattedAddress}',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: TextStyle(color: Color(0xff28476E), fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Text(
                                          //       '${selectedPlace?.geometry?.location.lat},${selectedPlace?.geometry?.location.lat}',
                                          //       textAlign: TextAlign.right,
                                          //       style: TextStyle(color: Color(0xff28476E), fontSize: 15),
                                          //     ),
                                          //   ],
                                          // ),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (_deliveryController.isCheckedPick == true) {
                                            print('pick And Drop klklk');
                                            _deliveryController.isCheckedPick = false;
                                            setState(() {});
                                          } else {
                                            _deliveryController.addMarker();
                                            _deliveryController.isCheckedPick = true;
                                            if (widget.isOutCity == 5 || widget.isOutCity == 6) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (ctx) => DetailPage(
                                                            isOutCity: widget.isOutCity,
                                                            carTitle: widget.carTile,
                                                          )));
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (ctx) => PaymentMethod(
                                                            isOutCity: widget.isOutCity,
                                                            carTitle: widget.carTile,
                                                          )));
                                            }
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            color: _deliveryController.isCheckedPick ? Color(0xff99DEF8) : Color(0xff28476E),
                                          ),
                                          child: Center(
                                            child: Text(
                                              _deliveryController.isCheckedPick == true
                                                  ? 'تأكيد مكان استلام الطرد'
                                                  : 'تأكيد مكان تسليم الطرد',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: _deliveryController.isCheckedPick ? Color(0xff28476E) : Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ));
                  },
                  pinBuilder: (context, state) {
                    if (state == PinState.Idle) {
                      return Icon(
                        Icons.location_on,
                        size: 50,
                        color: Colors.red,
                      );
                    } else {
                      return Icon(
                        Icons.location_searching,
                        size: 50,
                        color: Colors.red,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/backButton.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        widget.isOutCity == 0
                            ? 'شحن طرود ( خارج المدينة )'
                            : widget.isOutCity == 1
                                ? 'ارسال واستقبال اطرود'
                                : widget.isOutCity == 3
                                    ? 'شحن عفش ( خارج المدينة )'
                                    : widget.isOutCity == 4
                                        ? 'نقل عفش'
                                        : widget.isOutCity == 5
                                            ? ' سطحة ( خارج المدينة )'
                                            : 'سطحة ( داخل المدينة )',
                        maxLines: 1,
                        style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
