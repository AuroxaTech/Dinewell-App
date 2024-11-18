import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:flutter/material.dart';

class HNotificationTrackOrderScreen extends StatefulWidget {
  const HNotificationTrackOrderScreen({super.key});

  @override
  State<HNotificationTrackOrderScreen> createState() =>
      _HNotificationTrackOrderScreenState();
}

class _HNotificationTrackOrderScreenState
    extends State<HNotificationTrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            ConstanceData.h38,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: 380,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.isLightTheme
                        ? Color.fromARGB(255, 231, 231, 231)
                        : Colors.transparent,
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                    offset: Offset(0.0, 0.0),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Text(
                          "Track Your Order",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Estimated delivery time of 35 minutes",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                  ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ConstanceData.h39,
                                              height: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 3,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).dividerColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ConstanceData.h39,
                                              height: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 3,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).dividerColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 3,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).dividerColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Order Placed",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Estimated delivery time of 35 minutes",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Preparing",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "We are preparing your order!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Delivery In Progress",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 16,
                                                color: Theme.of(context)
                                                    .dividerColor,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Your food is on the way!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Order Delivered",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 16,
                                                color: Theme.of(context)
                                                    .dividerColor,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Your order has been delivered!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
