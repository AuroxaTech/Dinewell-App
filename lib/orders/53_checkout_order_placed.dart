import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:flutter/material.dart';

class CheckoutOrderPlacedScreen extends StatefulWidget {
  const CheckoutOrderPlacedScreen({super.key});

  @override
  State<CheckoutOrderPlacedScreen> createState() =>
      _CheckoutOrderPlacedScreenState();
}

class _CheckoutOrderPlacedScreenState extends State<CheckoutOrderPlacedScreen> {
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
                SizedBox(
                  width: 25,
                ),
                Text(
                  "Step 4/4",
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
                    ConstanceData.r48,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Your Order Has Been Placed\nSuccessfully!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your order has been successfully completed. sWithin moments you will receive a notification with the receipt of your purchase and you can track every step of your order.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                ],
              ),
            ),
            MyButton(
                btnName: "Finish Order",
                click: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              height: 20,
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
