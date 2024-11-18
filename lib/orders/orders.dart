import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constance/constance.dart';
import '../Constance/theme.dart';
import '../Constance/utils.dart';
import '../Widget/qr_full_screen.dart';
import '../Widget/tabbar_drawer_widget.dart';
import '../Widget/tabbar_status_bar.dart';
import '../models/aboutus_model.dart';
import '../models/all_cards_list_model.dart';
import '../models/orders_list_model.dart';
import '../models/profile_details_model.dart';
import '../services/api_manager.dart';
import '../services/local_storage_service.dart';

class OrdersScreen extends StatefulWidget {
  final AnimationController animationController;

  const OrdersScreen({super.key, required this.animationController});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController controller;
  bool isLoadingSliderDetail = false;
  var sliderImageHeight = 0.0;
  ProfileDetailsModel userProfileDetails = ProfileDetailsModel();
  AboutUsData aboutUsData = AboutUsData();

  List<CardListData> cardsList = [];
  List<OrdersListData> ordersList = [];
  String? cardId;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    widget.animationController.forward();
    controller = ScrollController(initialScrollOffset: 0.0);

    controller.addListener(() {
      // ignore: unnecessary_null_comparison
      if (context != null) {
        if (controller.offset < 0) {
          _animationController.animateTo(0.0);
        } else if (controller.offset > 0.0 &&
            controller.offset < sliderImageHeight) {
          if (controller.offset < ((sliderImageHeight / 1.5))) {
            _animationController
                .animateTo((controller.offset / sliderImageHeight));
          } else {
            _animationController
                .animateTo((sliderImageHeight / 1.5) / sliderImageHeight);
          }
        }
      }
    });
    loadingSliderDetail();
    super.initState();
    apiAllCards();
    apiOrdersList();
    apiGetUserDetails();
    apiFetchAboutUsData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  loadingSliderDetail() async {
    setState(() {
      isLoadingSliderDetail = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      isLoadingSliderDetail = false;
    });
  }

  getCallbackDrawer(bool isRemote) {
    if (isRemote == true) {
      apiAllCards();
      apiOrdersList();
      apiGetUserDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    sliderImageHeight = MediaQuery.of(context).size.width * 1.3;
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
            opacity: widget.animationController,
            child: Transform(
                transform: new Matrix4.translationValues(
                  0.0,
                  40 * (1.0 - widget.animationController.value),
                  0.0,
                ),
                child: Scaffold(
                  key: _scaffoldKey,
                  drawer: TabbarDrawerWidget(
                      callbackHomeFunction: getCallbackDrawer,
                      userProfileDetails: userProfileDetails),
                  body: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      TabbarStatusBarWidget(
                          isFrom: '', scaffoldKey: _scaffoldKey),
                      Padding(
                        padding: const EdgeInsets.only(top: 110),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                disableCenter: true,
                                height: 245,
                                enableInfiniteScroll: false,
                                autoPlay: false,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  cardId = cardsList[index].id;
                                  apiOrdersList();
                                  setState(() {});
                                },
                              ),
                              items: cardsList
                                  .map(
                                    (item) => Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(20),
                                      color: item.bgColor != null &&
                                              item.bgColor != ""
                                          ? HexColor(item.bgColor ?? "")
                                          : const Color(0xff24934d),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                userProfileDetails.data?.name ??
                                                    "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: item.textLabelColor !=
                                                                  null &&
                                                              item.textLabelColor !=
                                                                  ""
                                                          ? HexColor(
                                                              item.textLabelColor ??
                                                                  "")
                                                          : Colors.white,
                                                    ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Balance",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: item.textLabelColor !=
                                                                      null &&
                                                                  item.textLabelColor !=
                                                                      ""
                                                              ? HexColor(
                                                                  item.textLabelColor ??
                                                                      "")
                                                              : Colors.white,
                                                        ),
                                                  ),
                                                  Text(
                                                    "${item.points ?? 0}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: item.textLabelColor !=
                                                                      null &&
                                                                  item.textLabelColor !=
                                                                      ""
                                                              ? HexColor(
                                                                  item.textLabelColor ??
                                                                      "")
                                                              : Colors.white,
                                                        ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "View and Save",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: item.textLabelColor !=
                                                                        null &&
                                                                    item.textLabelColor !=
                                                                        ""
                                                                ? HexColor(
                                                                    item.textLabelColor ??
                                                                        "")
                                                                : Colors.white,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Get Bonus Points by Shopping from your favorite stores and enjoy special perks!",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: item.textLabelColor !=
                                                                        null &&
                                                                    item.textLabelColor !=
                                                                        ""
                                                                ? HexColor(
                                                                    item.textLabelColor ??
                                                                        "")
                                                                : Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          QRFullScreenView(
                                                        centerWidget: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 0,
                                                                  color: Colors
                                                                      .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: (item.uniqueIdentifier !=
                                                                          null &&
                                                                      item.uniqueIdentifier !=
                                                                          "") &&
                                                                  (userProfileDetails
                                                                              .data
                                                                              ?.uniqueIdentifier !=
                                                                          null &&
                                                                      userProfileDetails
                                                                              .data
                                                                              ?.uniqueIdentifier !=
                                                                          "")
                                                              ? Container(
                                                                  child: UtilsFunctions
                                                                      .QrScannerView(
                                                                    url:
                                                                        "${ConstanceData.baseUrl}/en-us/staff/earn/${userProfileDetails.data?.uniqueIdentifier}/${item.uniqueIdentifier}",
                                                                  ),
                                                                )
                                                              : Image.asset(
                                                                  ConstanceData
                                                                      .r52,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 0,
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: (item.uniqueIdentifier !=
                                                                  null &&
                                                              item.uniqueIdentifier !=
                                                                  "") &&
                                                          (userProfileDetails
                                                                      .data
                                                                      ?.uniqueIdentifier !=
                                                                  null &&
                                                              userProfileDetails
                                                                      .data
                                                                      ?.uniqueIdentifier !=
                                                                  "")
                                                      ? Container(
                                                          child: UtilsFunctions
                                                              .QrScannerView(
                                                                  url:
                                                                      "${ConstanceData.baseUrl}/en-us/staff/earn/${userProfileDetails.data?.uniqueIdentifier}/${item.uniqueIdentifier}"))
                                                      : Image.asset(
                                                          ConstanceData.r52,
                                                          height: 75,
                                                          width: 75,
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Identifier",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: item.textLabelColor !=
                                                                        null &&
                                                                    item.textLabelColor !=
                                                                        ""
                                                                ? HexColor(
                                                                    item.textLabelColor ??
                                                                        "")
                                                                : Colors.white,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      "${item.uniqueIdentifier}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .copyWith(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: item.textLabelColor !=
                                                                        null &&
                                                                    item.textLabelColor !=
                                                                        ""
                                                                ? HexColor(
                                                                    item.textLabelColor ??
                                                                        "")
                                                                : Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Issue date",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: item.textLabelColor !=
                                                                          null &&
                                                                      item.textLabelColor !=
                                                                          ""
                                                                  ? HexColor(
                                                                      item.textLabelColor ??
                                                                          "")
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        "${item.issueDate != null && item.issueDate != "" ? getFormattedDate(item.issueDate!) : ""}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: item.textLabelColor !=
                                                                          null &&
                                                                      item.textLabelColor !=
                                                                          ""
                                                                  ? HexColor(
                                                                      item.textLabelColor ??
                                                                          "")
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Expiry date",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: item.textLabelColor !=
                                                                          null &&
                                                                      item.textLabelColor !=
                                                                          ""
                                                                  ? HexColor(
                                                                      item.textLabelColor ??
                                                                          "")
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        "${item.expirationDate != null && item.expirationDate != "" ? getFormattedDate(item.expirationDate!) : ""}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: item.textLabelColor !=
                                                                          null &&
                                                                      item.textLabelColor !=
                                                                          ""
                                                                  ? HexColor(
                                                                      item.textLabelColor ??
                                                                          "")
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10, top: 15),
                              child: Column(
                                children: [
                                  if (ordersList.isNotEmpty)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Orders",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView(
                                    padding: const EdgeInsets.all(0),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      for (var index = 0;
                                          index < ordersList.length;
                                          index++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .cardColor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${ordersList[index].partnerName ?? ""}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium!
                                                                .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "Points: ",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium!
                                                                      .copyWith(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                ),
                                                                Text(
                                                                  "${ordersList[index].points ?? ""}",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium!
                                                                      .copyWith(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "Purchase Amount: ",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium!
                                                                      .copyWith(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                ),
                                                                Text(
                                                                  "${ordersList[index].purchaseAmount ?? "0.0"} ",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium!
                                                                      .copyWith(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget com(String tex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tex,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 12, color: Theme.of(context).disabledColor),
        ),
        Image.asset(
          ConstanceData.h36,
          height: 12,
        )
      ],
    );
  }

  apiAllCards() async {
    cardsList.clear();
    await ApiManager().getAllCards().then((value) {
      cardsList = value ?? [];
      apiOrdersList();
      setState(() {});
    });
  }

  apiOrdersList() async {
    String cardsId = cardId ?? cardsList[0].id ?? "";
    setState(() {});
    ordersList.clear();
    await ApiManager().getOrdersList(cardId: cardsId).then((value) {
      ordersList = value ?? [];
      setState(() {});
    });
  }

  apiGetUserDetails() {
    if (LocalStorageService.prefs?.getString(ConstanceData.usersDetails) !=
            null &&
        LocalStorageService.prefs?.getString(ConstanceData.usersDetails) !=
            "") {
      final userMap = jsonDecode(LocalStorageService.prefs
                  ?.getString(ConstanceData.usersDetails) ??
              "") ??
          "";
      var user = ProfileDetailsModel.fromJson(userMap);
      userProfileDetails = user;
      setState(() {});
    }
  }

  apiFetchAboutUsData() async {
    await ApiManager().getAboutUs().then((value) {
      if (value != null) {
        aboutUsData = value;
      }
      setState(() {});
    });
  }

  String getFormattedDate(String date) {
    var localDate = DateTime.parse(date);
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(localDate.toString());
    var outputFormat = DateFormat('MMM dd,yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
