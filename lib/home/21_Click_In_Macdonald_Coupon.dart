import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Orders/46_order_customize_product.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:flutter/material.dart';

class ClickImMacDScreen extends StatefulWidget {
  const ClickImMacDScreen({super.key});

  @override
  State<ClickImMacDScreen> createState() => _ClickImMacDScreenState();
}

class _ClickImMacDScreenState extends State<ClickImMacDScreen> {
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
                    ConstanceData.h19,
                    height: 200,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        ConstanceData.h18,
                        fit: BoxFit.cover,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Image.asset(
                        ConstanceData.h25,
                        height: 130,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        ConstanceData.h20,
                        height: 15,
                      ),
                    ),
                    Image.asset(
                      ConstanceData.h21,
                      height: 15,
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
                  "Available at McDonald’s",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      ConstanceData.h22,
                      height: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2 McMenu’s for only 10.99\$",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "This offer expires in 2020-02-29",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 10,
                                    color: Theme.of(context).disabledColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "ABOUT THIS COUPON",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Offer valid for the following McMenu’s: McChicken,McRoyal Bacon, CBO, McRoyal Deluxe, Big Mac and Double Cheese Burger. With this coupon you have a maximum discount of 25%.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).disabledColor,
                      ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "REQUIREMENTS",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      ConstanceData.h23,
                      height: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "You need to have an account",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).disabledColor,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      ConstanceData.h23,
                      height: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Use between 11am and 12pm",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context).disabledColor,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: MyButton(
              btnName: "Redeem Offer!",
              click: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const OrderCustomizeProductScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
