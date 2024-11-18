import 'package:dinewell/Constance/colors.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/models/aboutus_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({
    super.key,
  });

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  AboutUsData aboutUsData = AboutUsData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiFetchAboutUsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: Stack(
              children: [
                Image.asset(
                  ConstanceData.h5,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              ConstanceData.h20,
                              height: 20,
                              // width: 20,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(ConstanceData.appIcon, height: 60),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "About us",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            )
                          ],
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Text(aboutUsData.text ?? ""),
          ))
        ],
      ),
    );
  }

  apiFetchAboutUsData() async {
    await ApiManager().getAboutUs().then((value) {
      if (value != null) {
        aboutUsData = value;
      }
      setState(() {});
    });
  }
}
