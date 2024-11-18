import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dinewell/Constance/colors.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Orders/47_order_details.dart';
import 'package:dinewell/Restaurants/restaurant_details.dart';
import 'package:dinewell/Widget/qr_full_screen.dart';
import 'package:dinewell/Widget/tabbar_drawer_widget.dart';
import 'package:dinewell/Widget/tabbar_status_bar.dart';
import 'package:dinewell/home/22_click_in_view.dart';
import 'package:dinewell/models/all_cards_list_model.dart';
import 'package:dinewell/models/all_partners_list_model.dart';
import 'package:dinewell/models/banners_model.dart';
import 'package:dinewell/models/profile_details_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '21_Click_In_Macdonald_Coupon.dart';

class HomeScreen extends StatefulWidget {
  final AnimationController animationController;

  const HomeScreen({super.key, required this.animationController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController controller;
  bool isLoadingSliderDetail = false;
  var sliderImageHeight = 0.0;

  TextEditingController searchController = TextEditingController();
  ProfileDetailsModel userProfileDetails = ProfileDetailsModel();
  List<CardListData> cardsList = [];
  List<BannersListData> bannersList = [];
  List<AllPartnersListData> partnersList = [];

  void initState() {
    _animationController =
        AnimationController(duration: const Duration(milliseconds: 0), vsync: this);
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
    apiGetAllBanners();
    apiGetUserDetails();
    apiGetAllPartners();
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  getCallbackDrawer(bool isRemote) {
    if (isRemote == true) {
      apiAllCards();
      apiGetAllBanners();
      apiGetUserDetails();
      apiGetAllPartners();
    }
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                          isFrom: 'Home', scaffoldKey: _scaffoldKey),
                      Padding(
                          padding: const EdgeInsets.only(top: 172),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              cardsList.isEmpty
                                  ? Container()
                                  : CarouselSlider(
                                      options: CarouselOptions(
                                          disableCenter: true,
                                          height: 245,
                                          enableInfiniteScroll: false,
                                          autoPlay: false,
                                          enlargeCenterPage: false,
                                          viewportFraction: 1),
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        userProfileDetails
                                                                .data?.name ??
                                                            "",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              fontSize: 14,
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
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            "Balance",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                  fontSize: 8,
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
                                                          Text(
                                                            "${item.points ?? 0}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                  fontSize: 14,
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
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "View and Save",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14,
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
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              "Get Bonus Points by Shopping from your favorite stores and enjoy special perks!",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        10,
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
                                                                centerWidget:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              0,
                                                                          color: Colors
                                                                              .white),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8)),
                                                                  child: (item.uniqueIdentifier != null &&
                                                                              item.uniqueIdentifier !=
                                                                                  "") &&
                                                                          (userProfileDetails.data?.uniqueIdentifier != null &&
                                                                              userProfileDetails.data?.uniqueIdentifier !=
                                                                                  "")
                                                                      ? Container(
                                                                          child: UtilsFunctions.QrScannerView(
                                                                              url:
                                                                                  "${ConstanceData.baseUrl}/en-us/staff/earn/${userProfileDetails.data?.uniqueIdentifier}/${item.uniqueIdentifier}"))
                                                                      : Image
                                                                          .asset(
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
                                                              color:
                                                                  Colors.white,
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
                                                                              "${ConstanceData.baseUrl}/en-us/staff/earn/${userProfileDetails.data?.uniqueIdentifier}/${item.uniqueIdentifier}"))
                                                              : Image.asset(
                                                                  ConstanceData
                                                                      .r52,
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
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Identifier",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        10,
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
                                                              "${item.uniqueIdentifier}",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        10,
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
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                "Issue date",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyLarge!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: item.textLabelColor != null &&
                                                                              item.textLabelColor !=
                                                                                  ""
                                                                          ? HexColor(item.textLabelColor ??
                                                                              "")
                                                                          : Colors
                                                                              .white,
                                                                    ),
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                item.issueDate != null && item.issueDate != "" ? getFormattedDate(item.issueDate!) : "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyLarge!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: item.textLabelColor != null &&
                                                                              item.textLabelColor !=
                                                                                  ""
                                                                          ? HexColor(item.textLabelColor ??
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
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                "Expiry date",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyLarge!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: item.textLabelColor != null &&
                                                                              item.textLabelColor !=
                                                                                  ""
                                                                          ? HexColor(item.textLabelColor ??
                                                                              "")
                                                                          : Colors
                                                                              .white,
                                                                    ),
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                item.expirationDate != null && item.expirationDate != "" ? getFormattedDate(item.expirationDate!) : "",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyLarge!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: item.textLabelColor != null &&
                                                                              item.textLabelColor !=
                                                                                  ""
                                                                          ? HexColor(item.textLabelColor ??
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
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15, top: 20),
                                  children: [
                                    if (bannersList.isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "What's in Today?",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      ClickInViewAllScreen(
                                                          bannersList:
                                                              bannersList),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "View All",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          if (bannersList.isNotEmpty)
                                            for (var item in bannersList)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>  RestaurantDetailsScreen(partnerId: item.partnerId??"",),
                                                      ),
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          item.banner ?? "",
                                                      fit: BoxFit.cover,
                                                      placeholder: (context,
                                                              url) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Container(
                                                        color: Colors.grey,
                                                        child: const Icon(
                                                            Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        ],
                                      ),
                                    ),
                                    if (partnersList.isNotEmpty)
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    if (partnersList.isNotEmpty)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Popular Restaurants Nearby",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      OrderDetailScreen(
                                                    partnersList: partnersList,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "View All",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    if (partnersList.isNotEmpty)
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ListView(
                                      padding: const EdgeInsets.all(0),
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        for (var index = 0;
                                            index < partnersList.length;
                                            index++)
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RestaurantDetailsScreen(
                                                            partnerId:
                                                                partnersList[
                                                                            index]
                                                                        .id ??
                                                                    "")),
                                              );
                                            },
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0,
                                                            left: 15,
                                                            right: 5),
                                                    child: Container(
                                                      child: ClipOval(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              partnersList[index]
                                                                      .avatar ??
                                                                  "",
                                                          height: 70,
                                                          width: 70,
                                                          fit: BoxFit.cover,
                                                          placeholder: (context,
                                                                  url) =>
                                                              const Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Container(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            child: const Icon(
                                                                Icons.error),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              13.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            partnersList[index]
                                                                    .name ??
                                                                "",
                                                            maxLines: 1,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium!
                                                                .copyWith(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          SizedBox(
                                                            child:
                                                                RatingBarIndicator(
                                                              rating: partnersList[index]
                                                                              .rating
                                                                              ?.totalRating !=
                                                                          null &&
                                                                      partnersList[index]
                                                                              .rating
                                                                              ?.totalRating !=
                                                                          0
                                                                  ? partnersList[
                                                                          index]
                                                                      .rating!
                                                                      .totalRating!
                                                                      .toDouble()
                                                                  : 0.0,
                                                              itemCount: 5,
                                                              itemSize: 15.0,
                                                              physics:
                                                                  const BouncingScrollPhysics(),
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Container(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(
                                                                    8, 5, 8, 5),
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .primaryBgColor
                                                                    .withOpacity(
                                                                        0.5),
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: AppColors
                                                                        .primaryBgColor
                                                                        .withOpacity(
                                                                            0.5)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            child: Text(
                                                              "BEST OFFERS",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 15,
                                                                vertical: 15),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Icon(
                                                              Icons.location_on,
                                                              color: AppColors
                                                                  .secondary,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              "${partnersList[index].distance ?? "0 km"} away",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                )));
      },
    );
  }

  Widget com(String tex) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tex,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 12, color: Theme.of(context).disabledColor),
          ),
          Image.asset(
            ConstanceData.h36,
            height: 12,
          )
        ],
      ),
    );
  }

  apiAllCards() async {
    cardsList.clear();
    await ApiManager().getAllCards().then((value) {
      cardsList = value ?? [];
      setState(() {});
    });
  }

  apiGetAllBanners() async {
    bannersList.clear();
    await ApiManager().getBanners().then((value) {
      bannersList = value ?? [];
      setState(() {});
    });
  }

  apiGetAllPartners() async {
    partnersList.clear();
    await ApiManager().getAllPartners().then((value) {
      partnersList = value ?? [];
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

  String getFormattedDate(String date) {
    var localDate = DateTime.parse(date);
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(localDate.toString());
    var outputFormat = DateFormat('MMM dd,yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
