import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dinewell/Constance/colors.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/models/country_list_model.dart';
import 'package:dinewell/models/languages_list_model.dart';
import 'package:dinewell/models/profile_details_model.dart';
import 'package:dinewell/services/api_constants.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:dinewell/services/api_service.dart';
import 'package:dinewell/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactUsScreen extends StatefulWidget {
  final bool isFromEdit;

  ContactUsScreen({super.key, this.isFromEdit = false});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  ProfileDetailsModel userProfileDetails = ProfileDetailsModel();

  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String profilePic = "";
  String selectedCountry = "";
  String selectedDialCode = "+1";
  String selectedLanguage = "en_US";
  File? selectedImageFile;
  String latitude = "";
  String longitude = "";
  List<CountryListData> countryList = [];
  List<LanguagesListData> languagesList = [];

  @override
  void initState() {
    super.initState();
    apiFetchCountryList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              ConstanceData.h20,
              height: 20,
              width: 20,
            ),
          ),
        ),
        title: Text(
          "Contact Us",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Image.asset(
                  ConstanceData.appIcon,
                  color: AppColors.secondary,
                  height: 90,
                ),
                SizedBox(height: 40),
                MyTextField(
                  controller: fullNameTextController,
                  hintText: "FULL NAME",
                  labelText: "FULL NAME",
                  isEnabled: false,
                  click: () {},
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: emailTextController,
                  isEnabled: false,
                  hintText: "EMAIL",
                  labelText: "EMAIL",
                  click: () {},
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: phoneTextController,
                  isEnabled: false,
                  prefixIcon: TextButton(
                    onPressed: () async {
                      openDialCodeListDialogue();
                    },
                    child: Text("$selectedDialCode",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 12,
                            )),
                  ),
                  hintText: "PHONE NUMBER",
                  labelText: "PHONE NUMBER",
                  click: () {},
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: subjectController,
                  hintText: "Subject",
                  labelText: "Subject",
                  isEnabled: false,
                  click: () {},
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: messageController,
                  hintText: "Message",
                  labelText: "Message",
                  isEnabled: false,
                  click: () {},
                ),
                SizedBox(height: 20),
                MyButton(
                    btnName: "Send Inquiry",
                    click: () async {
                      await apiContactUsSubmit();
                    }),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
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

  openCountryListDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.maxFinite,
            child: Column(
              children: [
                Text(
                  "Select Country",
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
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
                              selectedCountry = item.id ?? "";
                              setState(() {});
                            },
                            child: Text(
                              item.name?.en ?? "",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          )
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
                Text(
                  "Select Dial Code",
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
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
                                selectedDialCode = item.callingCode ?? "";
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "+${item.callingCode ?? ""}  ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${item.name?.en}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 10, color: Colors.black),
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

  openLanguageListDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.maxFinite,
            child: Column(
              children: [
                Text(
                  "Select Language",
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: new ListView(
                    children: [
                      if (languagesList.isNotEmpty)
                        for (var item in languagesList)
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              print("this is item of lang: ${selectedLanguage}");
                              selectedLanguage = "en_US";
                              setState(() {});
                            },
                            child: Text(
                              item.enUS ?? "",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          )
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

  apiContactUsSubmit() async {
    UtilsFunctions.showCustomDialogue(context);

    try {
      await ApiManager().apiContactUs(
          email: emailTextController.text,
          subject: subjectController.text,
          context: context,
          name: fullNameTextController.text,
          phone: selectedDialCode + phoneTextController.text,
          message: messageController.text);
    } catch (e) {
      rethrow;
    }
  }
}
