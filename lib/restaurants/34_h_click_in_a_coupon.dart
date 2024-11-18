import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:flutter/material.dart';

class HClickInaCouponScreen extends StatefulWidget {
  const HClickInaCouponScreen({super.key});

  @override
  State<HClickInaCouponScreen> createState() => _HClickInaCouponScreenState();
}

class _HClickInaCouponScreenState extends State<HClickInaCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    ConstanceData.h5,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Image.asset(
                    ConstanceData.h18,
                    fit: BoxFit.fill,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            ConstanceData.h20,
                            height: 20,
                          ),
                        ),
                        Image.asset(
                          ConstanceData.h21,
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ConstanceData.r5,
                          height: 150,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              children: [
                Text(
                  "Available at Starbucks",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      ConstanceData.r6,
                      height: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Caramel Apple Spice",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Expires in 18 minutes and 59 seconds",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 10,
                                  color: Theme.of(context).disabledColor),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ABOUT THIS COUPON",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Steamed apple juice complemented with cinnamon \nsyrup, whipped cream and a caramel sauce drizzle. \nRedeem this offer and save up to 75% off.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 10, color: Theme.of(context).disabledColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "REQUIREMENTS",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      ConstanceData.s13,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "You need to have an account",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 10, color: Theme.of(context).disabledColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      ConstanceData.s13,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Use between 8am and 12pm",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 10, color: Theme.of(context).disabledColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MyButton(
                btnName: "Redeem Offer!",
                click: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
