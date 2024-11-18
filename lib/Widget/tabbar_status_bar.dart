import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/home/24_h_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class TabbarStatusBarWidget extends StatefulWidget {
  final String  isFrom;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TabbarStatusBarWidget({super.key,required this.isFrom, required this.scaffoldKey,});

  @override
  State<TabbarStatusBarWidget> createState() => _TabbarStatusBarWidgetState();
}

class _TabbarStatusBarWidgetState extends State<TabbarStatusBarWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              ConstanceData.h5,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            widget.scaffoldKey.currentState!.openDrawer();
                          },
                          child: Container(height: 60,width: 25,
                            child: Image.asset(
                              ConstanceData.h6,
                              height: 20,
                              // width: 20,
                            ),
                          ),
                        ),
                        Image.asset(
                          ConstanceData.appIcon,
                          height: 60
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    HomeNotificationScreen(),
                              ),
                            );
                            // widget.notificationClickFunction();
                          },
                          child: Container(height: 60,width: 25,
                            child: Image.asset(
                              ConstanceData.h15,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(widget.isFrom == "Home")
                    SizedBox(height: 10,),
                  if(widget.isFrom == "Home")
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            secondaryColorString,
                            primaryColorString
                          ], begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(0.5, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp
                        ),
                        color: Colors.white),
                    width: context.width,
                    child: Text(
                      "\"Get Rewarded for Eating Out\"",
                      textAlign: TextAlign.center,

                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: primaryFont),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
