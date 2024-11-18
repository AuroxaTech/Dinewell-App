import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/auth/15-forgot_password_step_1.dart';
import 'package:dinewell/auth/3_what_is_your_name_step_1.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WelcomeBakeStep1Screen extends StatefulWidget {
  const WelcomeBakeStep1Screen({super.key});

  @override
  State<WelcomeBakeStep1Screen> createState() => _WelcomeBakeStep1ScreenState();
}

class _WelcomeBakeStep1ScreenState extends State<WelcomeBakeStep1Screen> {
  TextEditingController emailTextController = TextEditingController(text: kDebugMode?"member@example.com":"");
  TextEditingController passwordTextController = TextEditingController(text: kDebugMode?"welcome123":"");
 bool passwordVisible = true;
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
                    ConstanceData.s33,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Welcome Back",
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
                    "Login into your account and enjoy the best\nrewards from your favorite\nrestaurants!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
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
                              controller: emailTextController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "EMAIL",
                              labelText: "EMAIL",
                              suffixIcon: IconButton(
                                icon: Image.asset(
                                  ConstanceData.s6,
                                  height: 20,
                                ),
                                onPressed: () {},
                              ),
                              click: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextField(
                              controller: passwordTextController,
                              obscureText: passwordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "PASSWORD",
                              labelText: "PASSWORD",
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,size: 20,),
                                onPressed: () {
                                  setState(
                                        () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                              click: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ForgotPasswordStep1Screen(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "FORGOT PASSWORD?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: 10,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   ConstanceData.s17,
                      //   height: 60,
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            MyButton(
                btnName: "Sign In",
                click: () async {
                  if (emailTextController.text.trim() == "") {
                    UtilsFunctions.displayToast('Please enter the email.');
                  } else if (!UtilsFunctions.isValidEmail(
                      emailTextController.text.trim())) {
                    UtilsFunctions.displayToast('Please enter valid email.');
                  }else if (passwordTextController.text.trim() == "") {
                    UtilsFunctions.displayToast('Please enter the password.');
                  } else{
                    UtilsFunctions.showCustomDialogue(context);
                    await ApiManager().requestUserLogin(email: emailTextController.text,
                        password: passwordTextController.text, context: context);

                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const WhatIsYourNameStep1Screen(),
                      ),
                    );
                  },
                  child: Text(
                    " Sign Up",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
