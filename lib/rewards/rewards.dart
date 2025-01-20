import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/qr_full_screen.dart';
import 'package:dinewell/Widget/tabbar_drawer_widget.dart';
import 'package:dinewell/Widget/tabbar_status_bar.dart';
import 'package:dinewell/models/aboutus_model.dart';
import 'package:dinewell/models/all_cards_list_model.dart';
import 'package:dinewell/models/profile_details_model.dart';
import 'package:dinewell/models/rewards_list_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RewardsScreen extends StatefulWidget {
  final AnimationController animationController;

  const RewardsScreen({super.key, required this.animationController});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController controller;
  bool isLoadingSliderDetail = false;
  var sliderImageHeight = 0.0;
  ProfileDetailsModel userProfileDetails = ProfileDetailsModel();
  AboutUsData aboutUsData = AboutUsData();

  List<CardListData> cardsList = [];
  List<RewardsListData> rewardsList = [];
  String? cardId;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isLoadingRewards = false;
  bool hasFetchedRewards = false;
  bool isLoadingCards = false;

  @override
  void initState()  {
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
    apiGetUserDetails();
    apiRewardsList();
    apiFetchAboutUsData();
  }

  getCallbackDrawer(bool isRemote) {
    if (isRemote == true) {
      print("return not null");
      apiAllCards();
      apiGetUserDetails();
      apiRewardsList();
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

  int pageNumber = 0;

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
                userProfileDetails: userProfileDetails,
              ),
              body: Stack(
                alignment: Alignment.topCenter,
                children: [
                  TabbarStatusBarWidget(isFrom: '', scaffoldKey: _scaffoldKey),
                  Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: ListView(
                      children: [
                        if (cardsList.isNotEmpty)
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
                                apiRewardsList();
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
                                              userProfileDetails
                                                      .data?.name ??
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
                                                              : Colors
                                                                  .white,
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
                                                                (userProfileDetails.data?.uniqueIdentifier !=
                                                                        null &&
                                                                    userProfileDetails.data?.uniqueIdentifier !=
                                                                        "")
                                                            ? Container(
                                                                child: UtilsFunctions
                                                                    .QrScannerView(
                                                                        url:
                                                                            "${ConstanceData.baseUrl}/en-us/staff/earn/${userProfileDetails.data?.uniqueIdentifier}/${item.uniqueIdentifier}"))
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
                                                        color:
                                                            Colors.white),
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
                                                              : Colors
                                                                  .white,
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
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Issue date",
                                                      style:
                                                          Theme.of(context)
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
                                                      item.issueDate != null && item.issueDate != "" ? getFormattedDate(item.issueDate!) : "",
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      maxLines: 2,
                                                      style:
                                                          Theme.of(context)
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
                                                      style:
                                                          Theme.of(context)
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
                                                      item.expirationDate !=
                                                                  null &&
                                                              item.expirationDate !=
                                                                  ""
                                                          ? getFormattedDate(
                                                              item.expirationDate!)
                                                          : "",
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      style:
                                                          Theme.of(context)
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
                        if (isLoadingCards || isLoadingRewards)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        else if (hasFetchedRewards && rewardsList.isEmpty)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'No rewards available',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          )
                        else
                          Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Add Points Table Section
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Points System",
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      // Earn Points Section
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.circular(25.0),
                                        ),
                                        child: Text(
                                          'Earn 10 points for every \$1 Spent',
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "Redemption",
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      // Redemption Points Table
                                      Column(
                                        children: [
                                          rewardsTitle("\$10", "5000 Points", desc: "Min Redemption"),
                                          rewardsTitle("\$20", "10000 Points"),
                                          rewardsTitle("\$40 + \$10 Bonus", "20000 Points"),
                                          rewardsTitle("\$60 + \$40 Bonus", "30000 Points"),
                                          rewardsTitle("\$80 + \$80 Bonus", "40000 Points"),
                                          rewardsTitle("\$100 + \$200 Bonus", "50000 Points", desc: 'Max Cap'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Existing Available Rewards Section
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                  child: Text(
                                    "Available Rewards",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
                                    ),
                                  ),
                                ),
                                ...rewardsList.map((reward) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Image Section (if available)
                                        if (reward.image1 != null && reward.image1!.isNotEmpty)
                                          ClipRRect(
                                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                            child: Image.network(
                                              reward.image1!,
                                              height: 150,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) => Container(
                                                height: 150,
                                                color: Colors.grey[100],
                                                child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                                              ),
                                            ),
                                          ),

                                        // Content Section
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Points Badge
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      reward.title?.enUS ?? reward.name ?? '',
                                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context).primaryColor,
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        const Icon(
                                                          Icons.stars_rounded,
                                                          size: 16,
                                                          color: Colors.white,
                                                        ),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          '${reward.points}',
                                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),

                                              // Description
                                              Text(
                                                reward.description?.enUS ?? '',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.grey[600],
                                                  height: 1.5,
                                                ),
                                              ),

                                              const SizedBox(height: 16),

                                              // Footer Information
                                              Row(
                                                children: [
                                                  // Expiration Date
                                                  if (reward.expirationDate != null)
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.access_time,
                                                            size: 16,
                                                            color: Colors.grey[600],
                                                          ),
                                                          const SizedBox(width: 4),
                                                          Expanded(
                                                            child: Text(
                                                              'Expires ${getFormattedDate(reward.expirationDate!)}',
                                                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                color: Colors.grey[600],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                  // Redemption Count
                                                  if (reward.numberOfTimesRedeemed != null)
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.redeem,
                                                          size: 16,
                                                          color: Colors.grey[600],
                                                        ),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          '${reward.numberOfTimesRedeemed} redeemed',
                                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                            color: Colors.grey[600],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ),

                                              // Redeem Button
                                              const SizedBox(height: 16),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    _showRedeemConfirmation(reward);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Theme.of(context).primaryColor,
                                                    foregroundColor: Colors.white,
                                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const Icon(Icons.redeem, size: 20),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        'Redeem Reward',
                                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )).toList(),
                              ],
                            ),
                          ),
                      ],
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

  rewardsTitle(String title, String subtitle, {String? desc}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(desc != null ? 10 : 18),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (desc != null)
                    Text(
                      desc,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
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
    setState(() {
      isLoadingCards = true;
    });

    cardsList.clear();
    await ApiManager().getAllCards().then((value) {
      cardsList = value ?? [];
      apiRewardsList();
      setState(() {
        isLoadingCards = false;
      });
    }).catchError((error) {
      print("apiAllCards Error ===> ${error.toString()}");
      setState(() {
        isLoadingCards = false;
      });
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

  apiRewardsList() async {
    setState(() {
      isLoadingRewards = true;
    });

    String? cardsId;
    if (cardId != null && cardId!.isNotEmpty) {
      cardsId = cardId;
    } else if (cardsList.isNotEmpty && cardsList[0].id!.isNotEmpty) {
      cardsId = cardsList[0].id;
    } else {
      print("No valid cardId available to fetch rewards.");
      setState(() {
        isLoadingRewards = false;
        hasFetchedRewards = true;
      });
      return;
    }

    try {
      List<RewardsListData>? fetchedRewards = await ApiManager().getRewardsList(cardId: cardsId??"119373195290746316");
      if (fetchedRewards != null) {
        setState(() {
          rewardsList = fetchedRewards;
        });
      }
    } catch (e) {
      print("apiRewardsList Error ===> ${e.toString()}");
    } finally {
      setState(() {
        isLoadingRewards = false;
        hasFetchedRewards = true;
      });
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

  void _showRedeemConfirmation(RewardsListData reward) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Center(
            child: Text(
              'Redeem Reward',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to redeem this reward?',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.stars_rounded,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${reward.points} points will be\ndeducted',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _redeemReward(reward);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            )

          ],
        );
      },
    );
  }

  void _redeemReward(RewardsListData reward) {
    // TODO: Implement the API call to redeem the reward
    // You'll need to add the API endpoint and handle the response
    
    // Example implementation:
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // TODO: Replace with actual API call
    Future.delayed(const Duration(seconds: 2), () {
      // Hide loading indicator
      Navigator.of(context).pop();
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully redeemed ${reward.title?.enUS ?? reward.name}'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      
      // Refresh the rewards list
      apiRewardsList();
    });
  }
}
