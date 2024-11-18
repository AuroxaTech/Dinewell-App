import 'dart:io';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';

class YouAreReadyToStartScreen extends StatefulWidget {
  final String email;
  final String password;
  final String fullName;
  final int gender;
  final String phoneNumber;
  final String dialCode;
  final File? selectedImageFile;

  const YouAreReadyToStartScreen(
      {super.key,
      required this.email,
      required this.password,
      required this.fullName,
      required this.gender,
      required this.selectedImageFile,
      required this.phoneNumber,
      required this.dialCode});

  @override
  State<YouAreReadyToStartScreen> createState() =>
      _YouAreReadyToStartScreenState();
}

class _YouAreReadyToStartScreenState extends State<YouAreReadyToStartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
        "This is result of signup: "
            "\n email: ${widget.email}"
            "\n password: ${widget.password}"
            "\n gender: ${widget.gender}"
            "\n fullname: ${widget.fullName}"
            "\n dialCode: ${widget.dialCode}"
            "\n phoneNumber: ${widget.phoneNumber}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              ConstanceData.s31,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "You are Ready to Start!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Thank you for sign in into our app. You\ncan now order food from your favorite\nrestaurants with multiple advantages\nwithout losing any offer.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor,
                    ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyButton(
                    btnName: "Get Started",
                    click: () {


                      UtilsFunctions.showCustomDialogue(context);

                      ApiManager().requestUserRegister(
                          email: widget.email,
                          password: widget.password,
                          context: context,
                          name: widget.fullName,
                          phoneNumber: widget.phoneNumber,
                          dialCode: widget.dialCode,
                          gender: widget.gender,
                          selectedImageFile: widget.selectedImageFile);
                    }),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
