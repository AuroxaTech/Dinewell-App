import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/auth/6_add_your_email_step_4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAProfilePicScreen extends StatefulWidget {
  final String fullname;
  final int gender;
  const AddAProfilePicScreen({super.key, required this.fullname, required this.gender});

  @override
  State<AddAProfilePicScreen> createState() =>
      _AddAProfilePicScreenState();
}

class _AddAProfilePicScreenState extends State<AddAProfilePicScreen> {

  File? selectedImageFile;
  String pathOfImage = "${ConstanceData.s11}";
  List<String> pageView = [ ConstanceData.s11,ConstanceData.s12,ConstanceData.s32];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Path of image: ${pathOfImage}");
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
                  "Step 3/8",
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
              height: 60,
            ),
            Text(
              "Selected Picture",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 215,
              child:selectedImageFile != null &&
                  selectedImageFile?.path != ""
                  ? Image.file(
                selectedImageFile!,
                fit: BoxFit.fill,
              )
                  : CarouselSlider(
                options: CarouselOptions(
                    disableCenter: true,
                    height: 245,
                    enableInfiniteScroll: false,onPageChanged: (index, reason) {
                  pathOfImage = pageView[index];

                  print("Path of image: ${pathOfImage}");
                  setState(() {});
                },
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1),
               items: [
                 for(var i=0;i<pageView.length;i++)
                   Container(
                       width: double.infinity,
                       child:   Column(
                         children: [
                           Image.asset(
                             pageView[i],
                             height: 150,
                           ),
                           SizedBox(
                             height: 30,
                           ),
                           Row(mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 height: 4,
                                 width: 20,
                                 decoration: BoxDecoration(
                                   color: i == 0?Theme.of(context).primaryColor: Theme.of(context).dividerColor,
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(30)),
                                 ),
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Container(
                                 height: 4,
                                 width: 20,
                                 decoration: BoxDecoration(
                                   color: i == 1?Theme.of(context).primaryColor: Theme.of(context).dividerColor,
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(30)),
                                 ),
                               ),
                               SizedBox(
                                 width: 5,
                               ),
                               Container(
                                 height: 4,
                                 width: 20,
                                 decoration: BoxDecoration(
                                   color: i == 2?Theme.of(context).primaryColor: Theme.of(context).dividerColor,
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(30)),
                                 ),
                               )
                             ],
                           )
                         ],
                       )
                   )
               ],
              ) /*ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ConstanceData.s11,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ConstanceData.s12,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ConstanceData.s32,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 4,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )*/,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Add a Profile Picture",
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
              "Choose one of the following pictures\nfrom our gallery or add your own\nprofile picture.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                  ),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () async {
                await UtilsFunctions.selectPicture(
                    source: ImageSource.gallery)
                    .then((value) async {
                  if (value != null) {
                    setState(() {
                      selectedImageFile = value;
                    });
                  }
                });
              },
              child: Text(
                "Add Custom Picture",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
                btnName: "Next Step",
                click: () async {
                  if (selectedImageFile == null) {

                    print("Path of image: ${pathOfImage}");
                    final pickedFile = await UtilsFunctions.imageToFile(imageName: pathOfImage);
                    selectedImageFile = File(pickedFile.path);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddYourEmailStep4Screen(gender: widget.gender,fullName: widget.fullname,selectedImageFile: selectedImageFile),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
