import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Orders/52_checkout_payment_Info.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:flutter/material.dart';

class CheckOutAddressScreen extends StatefulWidget {
  const CheckOutAddressScreen({super.key});

  @override
  State<CheckOutAddressScreen> createState() => _CheckOutAddressScreenState();
}

class _CheckOutAddressScreenState extends State<CheckOutAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: MediaQuery.of(context).padding.top + 30,
            bottom: MediaQuery.of(context).padding.bottom + 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    ConstanceData.s1,
                    height: 20,
                  ),
                ),
                Text(
                  "Step 2/4",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).disabledColor,
                      ),
                ),
                Image.asset(
                  ConstanceData.s2,
                  height: 15,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Image.asset(
                    ConstanceData.r41,
                    height: 150,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Which Address Do You Want to\nReceive Your Order?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose the address where you want your\norder to be delivered.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8,bottom: 8),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "CHOOSE YOUR ADDRESS",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 8,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      ConstanceData.s6,
                                      height: 15,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Brooklyn, New York",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Flat Bush Street, Number 17, House Nr 323\nZip Code - 11203",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 8,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              ConstanceData.r37,
                              height: 40,
                            ),
                            Text(
                              "Change Restaurant",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
                btnName: "Next Step",
                click: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutPaymentInfoScreen(),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I accept the ",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Terms and Conditions",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
