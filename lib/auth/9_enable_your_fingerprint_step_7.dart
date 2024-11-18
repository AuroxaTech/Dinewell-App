/*

import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/auth/10_sync_all_your_accounts_step_8.dart';
import 'package:flutter/material.dart';

class EnableYourFingerprintStep7Screen extends StatefulWidget {
  const EnableYourFingerprintStep7Screen({super.key});

  @override
  State<EnableYourFingerprintStep7Screen> createState() =>
      _EnableYourFingerprintStep7ScreenState();
}

class _EnableYourFingerprintStep7ScreenState
    extends State<EnableYourFingerprintStep7Screen> {
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
                  "Step 7/10",
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
              height: 100,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Image.asset(
                    ConstanceData.s16,
                    height: 200,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Enable Your Fingerprint",
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
                    "In order to log in into your account in a \n faster and safer way, add your \n fingerprint.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    ConstanceData.s17,
                    height: 50,
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
                      builder: (_) => SyncAllYourAccountsSte8Screeen(),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Text(
              "Skip this Step",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
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
*/
