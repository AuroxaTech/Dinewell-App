import 'dart:io';

import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/auth/11_choose_your_favorite_restaurants_step_9.dart';
import 'package:flutter/material.dart';

import '12_do_you_want_to_receive_notifications.dart';

class SetYourPasswordStepScreen extends StatefulWidget {
  final String email;
  final String fullname;
  final String phoneNumber;
  final String dialCode;
  final int gender;
  final File? selectedImageFile;
  const SetYourPasswordStepScreen({super.key, required this.email, required this.fullname, required this.gender, this.selectedImageFile, required this.phoneNumber, required this.dialCode});

  @override
  State<SetYourPasswordStepScreen> createState() =>
      _SetYourPasswordStepScreenState();
}

class _SetYourPasswordStepScreenState extends State<SetYourPasswordStepScreen> {

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isPasswordValid = false;
  bool isConfirmPasswordValid = false;

  @override
  void initState() {
    super.initState();
    passwordTextController.addListener(validatePassword);
    confirmPasswordTextController.addListener(validateConfirmPassword);
  }

  @override
  void dispose() {
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }

  // Function to validate the password based on the specified rules
  void validatePassword() {
    String password = passwordTextController.text;
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.length >= 8;
    bool hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    setState(() {
      isPasswordValid = hasUppercase && hasDigits && hasSpecialCharacter;
    });
  }

  // Function to validate if the confirm password matches the password
  void validateConfirmPassword() {
    setState(() {
      isConfirmPasswordValid = confirmPasswordTextController.text == passwordTextController.text && isPasswordValid;
    });
  }
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
                  "Step 6/8",
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
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Image.asset(
                    ConstanceData.s14,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Set Your Password",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "In order to keep your account safe you need \nto create a strong password.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.isLightTheme
                                ? const Color.fromARGB(255, 231, 231, 231)
                                : Colors.transparent,
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: const Offset(0.0, 0.0),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextField(
                              obscureText: isPasswordVisible,
                              controller: passwordTextController,
                              hintText: "PASSWORD",
                              labelText: "PASSWORD",
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: IconButton(
                                icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey, size: 22),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.check_circle, color: isPasswordValid ? Colors.green : Colors.red, size: 22),
                                onPressed: () {},
                              ),
                              onChanged: (text) => validatePassword(), click: () {  },
                            ),
                            const SizedBox(height: 5),
                            MyTextField(
                              obscureText: isConfirmPasswordVisible,
                              controller: confirmPasswordTextController,
                              hintText: "CONFIRM PASSWORD",
                              labelText: "CONFIRM PASSWORD",
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: IconButton(
                                icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey, size: 22),
                                onPressed: () {
                                  setState(() {
                                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                  });
                                },
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.check_circle, color: isConfirmPasswordValid ? Colors.green : Colors.red, size: 22),
                                onPressed: () {},
                              ),
                              onChanged: (text) => validateConfirmPassword(), click: () {  },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "YOUR PHONE NUMBER MUST CONTAIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 8,
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                               isPasswordValid ?   Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ) : const Icon(Icons.check_circle_outline, color: Colors.red, size: 15,),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Between 8 and 20 characters",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 8,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                isPasswordValid ?   Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ) : const Icon(Icons.check_circle_outline, color: Colors.red, size: 15,),

                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1 upper case letter",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 8,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                isPasswordValid ?   Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ) : const Icon(Icons.check_circle_outline, color: Colors.red, size: 15,),

                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1 or more special character",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 8,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            MyButton(
                btnName: "Next Step",
                click: () {
                  RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');

                  if (!isPasswordValid) {
                    // Notify user if the password does not meet the requirements
                    UtilsFunctions.displayToast("Password does not meet the requirement, Please try again.");
                  } else if (!isConfirmPasswordValid) {
                    // Notify user if the confirm password does not match the password
                    UtilsFunctions.displayToast("Password and Confirm password do not match.");
                  } else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DoYouWantToReceiveNotificationScreen(email: widget.email,gender: widget.gender,fullName: widget.fullname,password: confirmPasswordTextController.text.trim(),selectedImageFile: widget.selectedImageFile,dialCode: widget.dialCode,phoneNumber: widget.phoneNumber),
                      ),
                    );
                  }

                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

}
