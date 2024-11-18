import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/auth/5_add_a_profile_picture_step_3.dart';
import 'package:flutter/material.dart';

class WhatIsYourGenderStep2 extends StatefulWidget {
  final String fullname;

  const WhatIsYourGenderStep2({super.key, required this.fullname});

  @override
  State<WhatIsYourGenderStep2> createState() => _WhatIsYourGenderStep2State();
}

class _WhatIsYourGenderStep2State extends State<WhatIsYourGenderStep2> {
  bool selectedMale = true;
  bool selectedFeMale = false;

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
                  "Step 2/8",
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
                    ConstanceData.s3,
                    height: 150,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "What is Your Gender?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "To make sure you receive the best \npersonalized offers we need to know \nyour gender.",
                  //   textAlign: TextAlign.center,
                  //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //         fontSize: 12,
                  //         color: Theme.of(context).disabledColor,
                  //       ),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              selectedFeMale = true;
                              selectedMale = false;
                              setState(() {});
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
                                    if (selectedFeMale)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            ConstanceData.s6,
                                            height: 15,
                                          )
                                        ],
                                      )
                                    else
                                      SizedBox(
                                        height: 15,
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      ConstanceData.s4,
                                      height: 60,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Female",
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
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              selectedFeMale = false;
                              selectedMale = true;
                              setState(() {});
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
                                    if (selectedMale)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            ConstanceData.s6,
                                            height: 15,
                                          )
                                        ],
                                      )
                                    else
                                      SizedBox(
                                        height: 15,
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      ConstanceData.s5,
                                      height: 60,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Male",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .disabledColor,
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
                      builder: (_) => AddAProfilePicScreen(
                          fullname: widget.fullname,
                          gender: selectedMale
                              ? 1
                              : selectedFeMale
                                  ? 0
                                  : 1),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            // InkWell(
            //   onTap: (){
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => AddAProfilePicScreen(
            //             fullname: widget.fullname,
            //             gender: selectedMale
            //                 ? 1
            //                 : selectedFeMale
            //                 ? 0
            //                 : 1),
            //       ),
            //     );
            //   },
            //   child: Text(
            //     "Skip this Step",
            //     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //         fontSize: 12,
            //         color: Theme.of(context).primaryColor,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
