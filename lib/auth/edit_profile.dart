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

class EditProfileScreen extends StatefulWidget {
  final bool isFromEdit;

  EditProfileScreen({super.key, this.isFromEdit = true});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ProfileDetailsModel userProfileDetails = ProfileDetailsModel();
  final _formKey = GlobalKey<FormState>();  // Add a global key for the form

  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  String profilePic = "";
  String selectedCountry = "";
  String selectedDialCode = "+1";
  String selectedLanguage = "en_US";
  File? selectedImageFile;
  String latitude = "";
  String longitude = "";
  List<CountryListData> countryList = [];
  List<LanguagesListData> languagesList = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    apiGetUserDetails();
    apiFetchCountryList();
    apiFetchLanguageList();
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
          widget.isFromEdit ? "Personal Information" : "Edit Profile",
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
            child: Form(
              key: _formKey, // Assign the form key
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: selectedImageFile != null && selectedImageFile?.path != ""
                              ? Image.file(
                            selectedImageFile!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                              : profilePic != ""
                              ? Container(
                            height: 100,
                            width: 100,
                            child: CachedNetworkImage(
                              imageUrl: profilePic,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.grey,
                                child: const Icon(Icons.error),
                              ),
                            ),
                          )
                              : Image.asset(
                            ConstanceData.h39,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: TextButton(
                          onPressed: () async {
                            if (widget.isFromEdit == true) {
                              await UtilsFunctions.selectPicture(source: ImageSource.gallery)
                                  .then((value) async {
                                if (value != null) {
                                  setState(() {
                                    selectedImageFile = value;
                                  });
                                }
                              });
                            }
                          },
                          child: Text("Edit"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    keyboardType: TextInputType.name,
                    controller: fullNameTextController,
                    hintText: "FULL NAME",
                    labelText: "FULL NAME",
                    isEnabled: widget.isFromEdit ? true : false,
                    click: () {},
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailTextController,
                    isEnabled: widget.isFromEdit ? true : false,
                    hintText: "EMAIL",
                    labelText: "EMAIL",
                    click: () {},
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: phoneTextController,
                    isPhoneNumber: true,
                    isEnabled: widget.isFromEdit ? false : true,
                    prefixIcon: TextButton(
                      onPressed: () async {
                        if (widget.isFromEdit == true) {
                          openDialCodeListDialogue();
                        }
                      },
                      child: Text(
                        "+$selectedDialCode",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    hintText: "PHONE NUMBER",
                    labelText: "PHONE NUMBER",
                    click: () {},
                    onChanged: (value) {
                      if (value.length == 10) {
                        setState(() {
                          errorMessage = null;
                        });
                      }
                    },
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5,right: 50),
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 20),
                  if (widget.isFromEdit == true)
                    MyButton(
                      btnName: "Save",
                      click: () async {
                        if (phoneTextController.text.length != 10) {
                          setState(() {
                            errorMessage = "Please enter 10 digits number";
                          });
                          return; // Prevent the API call from being executed
                        } else {
                          await apiUpdateProfile();
                        }
                      },
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  apiGetUserDetails() {
    if(LocalStorageService.prefs?.getString(ConstanceData.usersDetails)  != null && LocalStorageService.prefs?.getString(ConstanceData.usersDetails) != ""){
      final userMap = jsonDecode(
          LocalStorageService.prefs?.getString(ConstanceData.usersDetails) ?? "");
      var user = ProfileDetailsModel.fromJson(userMap);
      userProfileDetails = user;
      if (userProfileDetails.data?.name != null &&
          userProfileDetails.data?.name != "") {
        fullNameTextController.text = userProfileDetails.data?.name ?? "";
      }

      if (userProfileDetails.data?.email != null &&
          userProfileDetails.data?.email != "") {
        emailTextController.text = userProfileDetails.data?.email ?? "";
      }

      if (userProfileDetails.data?.avatar != null &&
          userProfileDetails.data?.avatar != "") {
        profilePic = userProfileDetails.data!.avatar!;
      }

      if (userProfileDetails.data?.countryCode != null &&
          userProfileDetails.data?.countryCode != "") {
        selectedCountry = userProfileDetails.data!.countryCode!;
      }

      if (userProfileDetails.data?.locale != null &&
          userProfileDetails.data?.locale != "") {
        selectedLanguage = userProfileDetails.data!.locale!;
      }

      if (userProfileDetails.data?.phoneCountry != null &&
          userProfileDetails.data?.phoneCountry != "") {
        selectedDialCode = userProfileDetails.data!.phoneCountry!;
      }

      if (userProfileDetails.data?.phone != null &&
          userProfileDetails.data?.phone != "") {
        phoneTextController.text = userProfileDetails.data!.phone!;
      }
      setState(() {});
    }
  }

  apiFetchCountryList() async {
      await ApiManager().getCountryList().then((value){
        if(value != null){
          countryList = value;
          setState(() {});
        }
      });
  }

  openCountryListDialogue(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5 ,
            width: double.maxFinite,
            child: Column(
              children: [

                const Text("Select Country",style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 10,),
                Expanded(
                  child: new ListView(
                    children: [
                      if(countryList.isNotEmpty)
                        for(var item in countryList)
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              selectedCountry = item.id ?? "";
                              setState(() {});
                            },
                            child: Text(
                              item.name?.en ?? "",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 10,
                                color: Colors.black
                              ),
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

  openDialCodeListDialogue(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5 ,
            width: double.maxFinite,
            child: Column(
              children: [
                const Text("Select Dial Code",style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 10,),
                Expanded(
                  child: new ListView(
                    children: [
                      if(countryList.isNotEmpty)
                        for(var item in countryList)
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
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${item.name?.en}",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            )
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

  apiFetchLanguageList() async {
    await ApiManager().getLanguagesList().then((value){
      if(value != null){
        languagesList = value;
        setState(() {});
      }
    });
  }

  openLanguageListDialogue(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.maxFinite,
            child: Column(
              children: [
                const Text("Select Language",style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 10,),
                Expanded(
                  child: new ListView(
                    children: [
                      if(languagesList.isNotEmpty)
                        for(var item in languagesList)
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
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black
                              ),
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

  apiUpdateProfile() async {
    UtilsFunctions.showCustomDialogue(context);
    String? authToken =
        LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ?? "";
    print("update profile token : ${authToken} ");

    final Map<String, dynamic> params = <String, dynamic>{
      "name": fullNameTextController.text,
      "lang": selectedLanguage,
      "country_code": selectedCountry,
      "phone_code":selectedDialCode,
      "phone_no":phoneTextController.text,
      "latitude": latitude,
      "longitude": longitude,
    };
    print("this is update profile params : ${params} ");

    Map<String, dynamic> formData = <String, dynamic>{};

    if (selectedImageFile != null) {
      String fileName = selectedImageFile!.path.split('/').last;
      formData = <String, dynamic>{
        "avatar": await MultipartFile.fromFile(selectedImageFile!.path,
            filename: fileName),
      };
    }

    try {
      String? authToken =
          LocalStorageService.prefs?.getString(ConstanceData.userAuthToken) ??
              "";
      var response =
      await ApiService(token: authToken,contentType: ContentType.json).post(ApiConstants.updateProfile,params: params,data: formData,isFormData: selectedImageFile != null?true:false);
      final newList = json.encode(response?.data);
      final extractedData = json.decode(newList);
      var loginData = ProfileDetailsModel.fromJson(extractedData);
      if (loginData.data != null) {
        Navigator.pop(context);
        UtilsFunctions.displayToast(loginData.message ?? "");
        await ApiManager().getUserProfileDetails();
        apiGetUserDetails();
      }else{
        Navigator.pop(context);
      }
    } catch (e) {
      rethrow;
    }
  }
}
