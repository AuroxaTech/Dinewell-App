/*

import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/auth/11_choose_your_favorite_restaurants_step_9.dart';
import 'package:flutter/material.dart';

class SyncAllYourAccountsSte8Screen extends StatefulWidget {
  const SyncAllYourAccountsSte8Screen({super.key});

  @override
  State<SyncAllYourAccountsSte8Screen> createState() =>
      _SyncAllYourAccountsSte8ScreenState();
}

class _SyncAllYourAccountsSte8ScreenState
    extends State<SyncAllYourAccountsSte8Screen> {
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
                  "Step 8/10",
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
                    ConstanceData.s18,
                    height: 150,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Sync All Your Accounts",
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
                    "Sync all of your accounts and don’t lose\n any important data.",
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
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
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
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "SELECT APP TO SYNC ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 8,
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.s19,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.s20,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.s21,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.s22,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "EMAIL ASSOCIATED WITH THE APPS",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 8,
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            MyTextField(
                              hintText: "EMAIL ASSOCIATED",
                              labelText: "EMAIL ASSOCIATED",
                              click: () {},
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            MyButton(
                btnName: "Next Step",
                click: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChooseYourFavoriteRestaurantsScreen(),
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
                  "Skip this Step",
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
*/
