import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Orders/57_checkout_payment_Info.dart';
import 'package:flutter/material.dart';

import '../Widget/buttons.dart';

class CheckOutTimeToPickOrderScreen extends StatefulWidget {
  const CheckOutTimeToPickOrderScreen({super.key});

  @override
  State<CheckOutTimeToPickOrderScreen> createState() =>
      _CheckOutTimeToPickOrderScreenState();
}

class _CheckOutTimeToPickOrderScreenState
    extends State<CheckOutTimeToPickOrderScreen> {
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
                  "Step 3/5",
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
                    ConstanceData.r49,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "How Long Will Take You To\nPick Up Your Order?",
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
                    "To make sure you receive your order good and\nwarm, we need an estimation of time that it\ntakes you to pick up your order.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    ConstanceData.r50,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            MyButton(
                btnName: "Next Step",
                click: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutPaymentInfo2Screen(),
                    ),
                  );
                }),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
