
import 'dart:io';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/auth/8_set_your_password_step_6.dart';
import 'package:dinewell/auth/add_you_phonenumber_step_5.dart';
import 'package:flutter/material.dart';

class AddYourEmailStep4Screen extends StatefulWidget {
  final String fullName;
  final int gender;
  final File? selectedImageFile;
  const AddYourEmailStep4Screen({super.key, required this.fullName, required this.gender, this.selectedImageFile});

  @override
  State<AddYourEmailStep4Screen> createState() =>
      _AddYourEmailStep4ScreenState();
}

class _AddYourEmailStep4ScreenState
    extends State<AddYourEmailStep4Screen> {

  TextEditingController emailTextController = TextEditingController();

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
                  "Step 4/8",
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
                    ConstanceData.s8,
                    height: 150,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Add Your Email",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
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
                            MyTextField(
                              controller: emailTextController,
                              hintText: "EMAIL",
                              labelText: "EMAIL",
                              keyboardType: TextInputType.emailAddress,
                              suffixIcon: IconButton(
                                icon: Image.asset(
                                  ConstanceData.s6,
                                  height: 20,
                                ),
                                onPressed: () {},
                              ),
                              click: () {},
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
                  if (emailTextController.text.trim() == "") {
                    UtilsFunctions.displayToast('Please enter the email.');
                  } else if (!UtilsFunctions.isValidEmail(
                      emailTextController.text.trim())) {
                    UtilsFunctions.displayToast('Please enter valid email.');
                  }else{

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddYourPhoneNumberStep4Screen(gender: widget.gender,email: emailTextController.text.trim(),fullname: widget.fullName,selectedImageFile: widget.selectedImageFile),
                      ),
                    );
                  }

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
