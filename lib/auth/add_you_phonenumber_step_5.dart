import 'dart:io';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/auth/8_set_your_password_step_6.dart';
import 'package:dinewell/models/country_list_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';

class AddYourPhoneNumberStep4Screen extends StatefulWidget {
  final String email;
  final String fullname;
  final int gender;
  final File? selectedImageFile;

  const AddYourPhoneNumberStep4Screen(
      {super.key,
      required this.email,
      required this.fullname,
      required this.gender,
      this.selectedImageFile});

  @override
  State<AddYourPhoneNumberStep4Screen> createState() => _AddYourPhoneNumberStep4ScreenState();
}

class _AddYourPhoneNumberStep4ScreenState extends State<AddYourPhoneNumberStep4Screen> {
  TextEditingController phoneNumberTextController = TextEditingController();
  String selectedDialCode = "+1";
  List<CountryListData> countryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    apiFetchCountryList();
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
                  "Step 5/8",
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
                    ConstanceData.s8,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Add Your Phone Number",
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
                    "Enter your phone number in order to \n send you your OTP security code.",
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
                              controller: phoneNumberTextController,
                              isEnabled: false,

                              keyboardType: TextInputType.phone,
                              prefixIcon: TextButton(
                                onPressed: () async {
                                  openDialCodeListDialogue();
                                },
                                child: Text("${selectedDialCode}",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontSize: 12,
                                        )),
                              ),
                              hintText: "PHONE NUMBER",
                              labelText: "PHONE NUMBER",
                              click: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   "YOUR PHONE NUMBER MUST CONTAIN",
                            //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            //       fontSize: 8,
                            //       color: Theme.of(context).disabledColor,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "YOUR PHONE NUMBER MUST CONTAIN",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 8,
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Exactly 11 numbers",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 8,
                                      color: Theme.of(context).disabledColor,
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
                  )
                ],
              ),
            ),
            MyButton(
                btnName: "Next Step",
                click: () {
                  if (validateMobile(phoneNumberTextController.text) != null) {
                    UtilsFunctions.displayToast(validateMobile(phoneNumberTextController.text)!);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SetYourPasswordStepScreen(
                          gender: widget.gender,
                          email: widget.email,
                          fullname: widget.fullname,
                          selectedImageFile: widget.selectedImageFile,
                          dialCode: selectedDialCode,
                          phoneNumber: phoneNumberTextController.text.trim(),
                        ),
                      ),
                    );
                  }
                }),
            const SizedBox(
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
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  String? validateMobile(String value) {
    // Updated pattern to check for exactly 11 digits
    String pattern = r'(^\+?\d{11}$)';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter a mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Your phone number must contain exactly 11 digits';
    }
    return null;
  }

  openDialCodeListDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.maxFinite,
            child: Column(
              children: [
                const Text(
                  "Select Dial Code",
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: new ListView(
                    children: [
                      if (countryList.isNotEmpty)
                        for (var item in countryList)
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                selectedDialCode = "+${item.callingCode}" ?? "";
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "+${item.callingCode ?? ""}  ",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${item.name?.en}",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  apiFetchCountryList() async {
    await ApiManager().getCountryList().then((value) {
      if (value != null) {
        countryList = value;
        setState(() {});
      }
    });
  }
}
