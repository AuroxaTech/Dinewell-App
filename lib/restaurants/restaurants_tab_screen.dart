import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Restaurants/restaurant_details.dart';
import 'package:dinewell/Widget/tabbar_drawer_widget.dart';
import 'package:dinewell/Widget/tabbar_status_bar.dart';
import 'package:dinewell/models/aboutus_model.dart';
import 'package:dinewell/models/all_partners_list_model.dart';
import 'package:dinewell/models/profile_details_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:geolocator/geolocator.dart';
import '../Constance/colors.dart';

class RestaurantTabScreen extends StatefulWidget {
  final AnimationController animationController;

  const RestaurantTabScreen({super.key, required this.animationController});

  @override
  State<RestaurantTabScreen> createState() => _RestaurantTabScreenState();
}

class _RestaurantTabScreenState extends State<RestaurantTabScreen>
    with TickerProviderStateMixin {
  List<AllPartnersListData> partnersList = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _animationController;
  late ScrollController controller;
  bool isLoadingSliderDetail = false;
  var sliderImageHeight = 0.0;

  ProfileDetailsModel userProfileDetails = ProfileDetailsModel();
  AboutUsData aboutUsData = AboutUsData();

  TextEditingController searchController = TextEditingController();

  double? latitude;
  double? longitude;

  @override
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
    getCurrentLocation(); // Get user location
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      apiGetAllPartners(); // Fetch partners based on location
      apiGetUserDetails();
      apiFetchAboutUsData();
    } catch (e) {
      print("Error fetching location: $e");
    }
  }

  getCallbackDrawer(bool isRemote) {
    if (isRemote == true) {
      apiGetUserDetails();
      apiGetAllPartners();
    }
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

  @override
  Widget build(BuildContext context) {
    sliderImageHeight = MediaQuery.of(context).size.width * 1.3;
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animationController,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              40 * (1.0 - widget.animationController.value),
              0.0,
            ),
            child: Scaffold(
              backgroundColor: AppColors.bgColor,
              key: _scaffoldKey,
              drawer: TabbarDrawerWidget(
                  callbackHomeFunction: getCallbackDrawer,
                  userProfileDetails: userProfileDetails),
              body: Stack(
                children: [
                  TabbarStatusBarWidget(isFrom: '', scaffoldKey: _scaffoldKey),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Expanded(
                                  child: GooglePlaceAutoCompleteTextField(
                                    boxDecoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.transparent),
                                    ),
                                    showError: true,
                                    textEditingController: searchController,
                                    googleAPIKey: ConstanceData.googleMapKey,
                                    inputDecoration: InputDecoration(
                                      hintText:
                                      "Search your restaurants by city",
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      labelStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                      contentPadding: const EdgeInsets.all(14),
                                    ),
                                    itemBuilder: (context, index,
                                        Prediction prediction) {
                                      return Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.location_on),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Expanded(
                                                child: Text(
                                                    prediction.description ??
                                                        ""))
                                          ],
                                        ),
                                      );
                                    },
                                    debounceTime: 800,
                                    isLatLngRequired: true,
                                    getPlaceDetailWithLatLng:
                                        (Prediction prediction) {
                                      latitude =
                                          double.parse(prediction.lat ?? "0");
                                      longitude =
                                          double.parse(prediction.lng ?? "0");
                                      apiGetLocationWisePartners();
                                    },
                                    itemClick: (Prediction prediction) {
                                      latitude =
                                          double.parse(prediction.lat ?? "0");
                                      longitude =
                                          double.parse(prediction.lng ?? "0");
                                      apiGetLocationWisePartners();
                                    },
                                    isCrossBtnShown: false,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      searchController.clear();
                                      apiGetAllPartners();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView(
                              padding:
                              const EdgeInsets.only(bottom: 10, top: 0),
                              shrinkWrap: true,
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
                                                    partnersList[index]
                                                        .id ??
                                                        "")),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      height: 110,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0, left: 15, right: 5),
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl: partnersList[index]
                                                    .avatar ??
                                                    "",
                                                height: 70,
                                                width: 70,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                    CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                    Container(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      child:
                                                      const Icon(Icons.error),
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(13.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    partnersList[index].name ??
                                                        "",
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  SizedBox(
                                                    child: RatingBarIndicator(
                                                      rating: partnersList[
                                                      index]
                                                          .rating
                                                          ?.totalRating !=
                                                          null &&
                                                          partnersList[
                                                          index]
                                                              .rating
                                                              ?.totalRating !=
                                                              0
                                                          ? partnersList[index]
                                                          .rating!
                                                          .totalRating!
                                                          .toDouble()
                                                          : 0.0,
                                                      itemCount: 5,
                                                      itemSize: 15.0,
                                                      physics:
                                                      const BouncingScrollPhysics(),
                                                      itemBuilder:
                                                          (context, _) =>
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(8, 5, 8, 5),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .primaryBgColor
                                                            .withOpacity(0.5),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: AppColors
                                                                .primaryBgColor
                                                                .withOpacity(
                                                                0.5)),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                    child: Text(
                                                      "BEST OFFERS",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                          fontSize: 8,
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
                                                const EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 15),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color:
                                                      AppColors.secondary,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      "${partnersList[index].distance ?? "0 km"} away",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                          fontSize: 8,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  apiGetAllPartners() async {
    if (latitude == null || longitude == null) {
      return;
    }
    if (mounted) {
      partnersList.clear();
      await ApiManager().getAllPartners().then((value) {
        partnersList = value?.where((partner) {
          double? partnerLat = double.tryParse(partner.latitude ?? "0");
          double? partnerLng = double.tryParse(partner.longitude ?? "0");
          return partnerLat != null &&
              partnerLng != null &&
              Geolocator.distanceBetween(latitude!, longitude!, partnerLat, partnerLng) <=
                  5000; // 5 km radius
        }).toList() ?? [];
        setState(() {});
      });
    }
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

  apiGetLocationWisePartners() async {
    partnersList.clear();
    await ApiManager()
        .getRestaurantLocationWiseSearch(
        latitude: latitude ??
            double.parse(userProfileDetails.data?.latitude ?? "0"),
        longitude: longitude ??
            double.parse(userProfileDetails.data?.longitude ?? "0"))
        .then((value) {
      partnersList = value ?? [];
      setState(() {});
    });
  }
}
