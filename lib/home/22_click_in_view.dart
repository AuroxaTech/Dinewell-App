import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/models/banners_model.dart';
import 'package:flutter/material.dart';
import '../Restaurants/restaurant_details.dart';

class ClickInViewAllScreen extends StatefulWidget {
  final  List<BannersListData> bannersList;

   const ClickInViewAllScreen({super.key, required this.bannersList});

  @override
  State<ClickInViewAllScreen> createState() => _ClickInViewAllScreenState();
}

class _ClickInViewAllScreenState extends State<ClickInViewAllScreen> {


  @override
  Widget build(BuildContext context) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (_) => WhatISInTodayFilterScreen(),
                        //       ),
                        //     );
                        //   },
                        //   child: Image.asset(
                        //     ConstanceData.h30,
                        //     height: 20,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "What’s In Today?",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          /*Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              children: [
                Image.asset(
                  ConstanceData.h26,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  ConstanceData.h27,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  ConstanceData.h28,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),*/
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                if (widget.bannersList.isNotEmpty)
                  for (var item in widget.bannersList)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RestaurantDetailsScreen(partnerId: item.partnerId??"",),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: item.banner ?? "",
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const Center(
                                child:
                                CircularProgressIndicator()),
                            errorWidget:
                                (context, url, error) =>
                                Container(
                                  color: Colors.grey,
                                  child: const Icon(Icons.error),
                                ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
