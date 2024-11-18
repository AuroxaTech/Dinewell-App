import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinewell/Constance/colors.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Splash/2_welcome_screen.dart';
import 'package:dinewell/auth/edit_profile.dart';
import 'package:dinewell/home/about_us_screen.dart';
import 'package:dinewell/home/contact_us_screen.dart';
import 'package:dinewell/models/profile_details_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';

class TabbarDrawerWidget extends StatefulWidget {
  final Function callbackHomeFunction;
  final ProfileDetailsModel userProfileDetails;
  const TabbarDrawerWidget({super.key, required this.callbackHomeFunction, required this.userProfileDetails});

  @override
  State<TabbarDrawerWidget> createState() => _TabbarDrawerWidgetState();
}

class _TabbarDrawerWidgetState extends State<TabbarDrawerWidget> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  ConstanceData.h29,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              ConstanceData.h20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 90, right: 20, left: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: widget.userProfileDetails.data?.avatar !=
                        null &&
                        widget.userProfileDetails.data?.avatar != ""
                        ? Container(
                      height: 70,
                      width: 70,
                      child: CachedNetworkImage(
                        imageUrl: widget.userProfileDetails
                            .data?.avatar ??
                            "",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                        const Center(
                            child:
                            CircularProgressIndicator()),
                        errorWidget:
                            (context, url, error) =>
                            Container(
                              color: Theme.of(context).primaryColor,
                              child: const Icon(Icons.error),
                            ),
                      ),
                    )
                        : Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                        BorderRadius.circular(35),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(
                left: 18,
                right: 18,
                bottom:
                MediaQuery.of(context).padding.bottom + 16),
            children: [
              Text(
                widget.userProfileDetails.data?.name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Account",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EditProfileScreen(isFromEdit: true),
                      ),
                    );
                  },
                  child: com("Personal Information")),
              // SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   child: com("Edit Profile"),
              //   onTap: () async {
              //     var value = await Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (_) =>
              //             EditProfileScreen(isFromEdit: true),
              //       ),
              //     );
              //     if (value != null) {
              //       print("return not null");
              //       widget.callbackHomeFunction(value);
              //     }
              //   },
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Help and Support",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            AboutUsScreen(),
                      ),
                    );
                  },
                  child: com("About Us")),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ContactUsScreen(),
                      ),
                    );
                  },
                  child: com("Contact Us")),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  UtilsFunctions.showCustomDialogue(context);
                  await ApiManager().userLogout();

                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WelComeScreen(),
                    ),
                        (route) => false,
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      ConstanceData.s38,
                      height: 22,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Log Out",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        fontSize: 14,
                        color: HexColor("#E66767"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }



  Widget com(String tex) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tex,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 14, color: Theme.of(context).disabledColor),
          ),
          Image.asset(
            ConstanceData.h36,
            height: 14,
          )
        ],
      ),
    );
  }
}
