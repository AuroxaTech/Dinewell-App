import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/auth/4_what_is_your_gender_step_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class WhatIsYourNameStep1Screen extends StatefulWidget {
  const WhatIsYourNameStep1Screen({super.key});

  @override
  State<WhatIsYourNameStep1Screen> createState() =>
      _WhatIsYourNameStep1ScreenState();
}

class _WhatIsYourNameStep1ScreenState extends State<WhatIsYourNameStep1Screen> {

  TextEditingController fullNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        alignment: Alignment.topCenter,
        children: [

          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    ConstanceData.s29,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "What is Your Name?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "In order to help us identify you, we need\nto know your real name ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
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
                          MyTextField(keyboardType: TextInputType.name,
                            controller: fullNameTextController,
                            hintText: "FULL NAME",
                            labelText: "FULL NAME",
                            click: () {},
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   "YOU NAME MUST CONTAIN",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyLarge!
                          //       .copyWith(
                          //       fontSize: 8,
                          //       color: Theme.of(context).disabledColor,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   children: [
                          //     Image.asset(
                          //       ConstanceData.s13,
                          //       height: 15,
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text(
                          //       "At least 5 characters",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .bodyLarge!
                          //           .copyWith(
                          //           fontSize: 8,
                          //           color:
                          //           Theme.of(context).disabledColor,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: MyButton(
                      btnName: "Next Step",
                      click: () {
                        if(fullNameTextController.text.trim() == ""){
                          UtilsFunctions.displayToast("Please enter your fullname.");
                        }else if (!RegExp(r"^[a-z A-Z]+$").hasMatch(fullNameTextController.text)){
                          UtilsFunctions.displayToast("Please enter a valid name with only alphabets");
                        }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WhatIsYourGenderStep2(fullname:fullNameTextController.text.trim(),),
                            ),
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Text(
              "Step 1/8",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).disabledColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
