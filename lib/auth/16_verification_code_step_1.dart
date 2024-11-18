import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/auth/17_set_your_new_password_step_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationCodeStep1Screen extends StatefulWidget {
  const VerificationCodeStep1Screen({super.key});

  @override
  State<VerificationCodeStep1Screen> createState() =>
      _VerificationCodeStep1ScreenState();
}

class _VerificationCodeStep1ScreenState
    extends State<VerificationCodeStep1Screen> {
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
                  "Step 2/3",
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
                    ConstanceData.s10,
                    height: 150,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Enter the Verification Code",
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
                    "Enter the 4 digit number that we send \nto (+1) 1-541-754-3010.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
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
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OtpTextField(
                            numberOfFields: 4,
                            focusedBorderColor: Theme.of(context).primaryColor,
                            fieldWidth: 40,
                            autoFocus: true,
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 10,
                                    ),
                            keyboardType: TextInputType.number,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
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
                      builder: (_) => SetYourNewPasswordStepScreen(),
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
                  "Did not Receive Anything? ",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Resend Code ",
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
