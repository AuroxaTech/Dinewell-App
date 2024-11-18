import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Orders/51_checkout_address.dart';
import 'package:dinewell/Orders/55_checkout_choose_store_Info.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:flutter/material.dart';

class CheckoutChooseMethodScreen extends StatefulWidget {
  const CheckoutChooseMethodScreen({super.key});

  @override
  State<CheckoutChooseMethodScreen> createState() =>
      _CheckoutChooseMethodScreenState();
}

class _CheckoutChooseMethodScreenState
    extends State<CheckoutChooseMethodScreen> {
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
                  "Step 1/4",
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
                    ConstanceData.r39,
                    height: 150,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "How Do You Want To Receive\nYour Order?",
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
                    "Choose one of the following methods\nto receive your order.",
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CheckOutChooseStoreInfoScreen(),
                                ),
                              );
                            },
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
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 7,
                                          backgroundColor:
                                              Theme.of(context).dividerColor,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      ConstanceData.h22,
                                      height: 60,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Pick Up From\nStore",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .dividerColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CheckOutAddressScreen(),
                                ),
                              );
                            },
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
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          ConstanceData.s6,
                                          height: 15,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      ConstanceData.r40,
                                      height: 60,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Uber Eats",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      builder: (_) => CheckOutAddressScreen(),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
