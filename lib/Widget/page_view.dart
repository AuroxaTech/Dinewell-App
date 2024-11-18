import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Orders/orders.dart';
import 'package:dinewell/Restaurants/restaurants_tab_screen.dart';
import 'package:dinewell/home/home_screen.dart';
import 'package:dinewell/rewards/rewards.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class PageScreen extends StatefulWidget {
  final Position currentLocation;
   PageScreen({super.key, required this.currentLocation});

  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Widget indexView;
  BottomBarType bottomBarType = BottomBarType.Home;

  @override
  void initState() {

    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = HomeScreen(
      animationController: animationController,
    );
    animationController..forward();
    print("current Location : ${widget.currentLocation.latitude},${widget.currentLocation.longitude}");
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.getTheme().scaffoldBackgroundColor,
        bottomNavigationBar: Container(
            height: 57 + MediaQuery.of(context).padding.bottom,
            child: getBottomBarUI(bottomBarType)),
        body: indexView,
      ),
    );
  }

  void tabClick(BottomBarType tabType) {
    if (tabType != bottomBarType) {
      bottomBarType = tabType;
      animationController.reverse().then((f) {
        if (tabType == BottomBarType.Home) {
          setState(() {
            indexView = HomeScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Restaurants) {
          setState(() {
            indexView = RestaurantTabScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Orders) {
          setState(() {
            indexView = OrdersScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Rewards) {
          setState(() {
            indexView = RewardsScreen(
              animationController: animationController,
            );
          });
        }
      });
    }
  }

  Widget getBottomBarUI(BottomBarType tabType) {
    return Container(
      decoration: BoxDecoration(
        color:
            AppTheme.isLightTheme ? HexColor("#FFFFFF") : HexColor("#111827"),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 2,
            offset: Offset(5.0, 5.0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 24,
          left: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                tabClick(BottomBarType.Home);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: 60,
                    decoration: BoxDecoration(
                        color: tabType == BottomBarType.Home
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),


                  tabType == BottomBarType.Home ?
                  Icon(Icons.home, color: Theme.of(context).primaryColor,size: 25,) :
                  Icon(Icons.home_outlined, color: Theme.of(context).dividerColor, size: 25),

                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 12,
                          color: tabType == BottomBarType.Home
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                tabClick(BottomBarType.Restaurants);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: 60,
                    decoration: BoxDecoration(
                        color: tabType == BottomBarType.Restaurants
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  tabType == BottomBarType.Restaurants ?
                  Icon(Icons.location_on, color: Theme.of(context).primaryColor,size: 25,) :
                  Icon(Icons.location_on_outlined, color: Theme.of(context).dividerColor, size: 25),

                  // Image.asset(
                  //   ConstanceData.h2,
                  //   color: tabType == BottomBarType.Restaurants
                  //       ? Theme.of(context).primaryColor
                  //       : Theme.of(context).dividerColor,
                  //   height: 20,
                  // ),
                  Text(
                    "Restaurants",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 12,
                          color: tabType == BottomBarType.Restaurants
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                tabClick(BottomBarType.Orders);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: 60,
                    decoration: BoxDecoration(
                        color: tabType == BottomBarType.Orders
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  tabType == BottomBarType.Orders ?
                  Icon(Icons.receipt_long, color: Theme.of(context).primaryColor,size: 25,) :
                  Icon(Icons.receipt_long_outlined, color: Theme.of(context).dividerColor, size: 25),
                  // Image.asset(
                  //   ConstanceData.h3,
                  //   color: tabType == BottomBarType.Orders
                  //       ? Theme.of(context).primaryColor
                  //       : Theme.of(context).dividerColor,
                  //   height: 20,
                  // ),
                  Text(
                    "Orders",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 12,
                          color: tabType == BottomBarType.Orders
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                tabClick(
                  BottomBarType.Rewards,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: 60,
                    decoration: BoxDecoration(
                        color: tabType == BottomBarType.Rewards
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  tabType == BottomBarType.Rewards ?
                  Icon(Icons.star, color: Theme.of(context).primaryColor,size: 25,) :
                  Icon(Icons.star_border_outlined, color: Theme.of(context).dividerColor, size: 25),
                  // Image.asset(
                  //   ConstanceData.h4,
                  //   color: tabType == BottomBarType.Rewards
                  //       ? Theme.of(context).primaryColor
                  //       : Theme.of(context).dividerColor,
                  //   height: 20,
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    "Rewards",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 12,
                          color: tabType == BottomBarType.Rewards
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum BottomBarType {
  Home,
  Restaurants,
  Orders,
  Rewards,
}
