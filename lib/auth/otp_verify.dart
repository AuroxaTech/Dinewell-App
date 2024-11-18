import 'package:dinewell/Constance/colors.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/home/location_fetch_page.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:pinput/pinput.dart';

import '../Widget/buttons.dart';

class OtpVerified extends StatefulWidget {
  const OtpVerified({super.key});

  @override
  State<OtpVerified> createState() => _OtpVerifiedState();
}

class _OtpVerifiedState extends State<OtpVerified> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      sendOTP();
    });
    super.initState();
  }

  sendOTP() async {
    UtilsFunctions.showCustomDialogue(context, title: "Sending OTP to your email...");
    await ApiManager().sendOTP();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = AppColors.secondary;
    final fillColor = Color.fromRGBO(243, 246, 249, 0);
    final borderColor = Theme.of(context).primaryColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: AppColors.secondary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                ConstanceData.h29,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Verification code",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('An verification code has been dispatched to your account. Kindly check and activate your email address.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!)
                      .paddingOnly(left: 20, right: 20, bottom: 50),
                  Expanded(
                    child: Column(
                      children: [
                        Pinput(
                          controller: pinController,
                          focusNode: focusNode,
                          length: 5,
                          defaultPinTheme: defaultPinTheme,
                          separatorBuilder: (index) => const SizedBox(width: 8),
                          validator: (value) {
                            return value != null ? null : 'Pin is incorrect';
                          },
                          // onClipboardFound: (value) {
                          //   debugPrint('onClipboardFound: $value');
                          //   pinController.setText(value);
                          // },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: focusedBorderColor,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                        Align(
                          // alignment: Alignment.topRight,
                          child: TextButton(
                            child: Text('Resend', style: Theme.of(context).textTheme.titleMedium!),
                            onPressed: () {
                              sendOTP();
                            },
                          ).paddingOnly(left: 20, right: 20, top: 10),
                        ),
                      ],
                    ),
                  ),
                  MyButton(
                    btnName: "Validate",
                    click: () async {
                      focusNode.unfocus();
                      formKey.currentState!.validate();
                      if (formKey.currentState?.validate() == true) {
                        if(pinController.text.isNotEmpty){
                          UtilsFunctions.showCustomDialogue(context);
                          print(pinController.value.text);
                          await ApiManager().verifiedOTP(pinController.value.text);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LocationFetchPage(),
                            ),
                          );

                        }else{
                          UtilsFunctions.displayToast("Please enter the otp.");
                        }

                      }
                    },
                  ).paddingAll(20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
