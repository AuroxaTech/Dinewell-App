import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Constance/utils.dart';
import 'package:dinewell/Restaurants/27_restaurants_search_for_restaurants.dart';
import 'package:dinewell/models/partner_details_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantsScreen extends StatefulWidget {

  final String partnerId;
  const RestaurantsScreen({super.key, required this.partnerId});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen>
    with TickerProviderStateMixin {

  PartnerDetailsData partnerDetails = PartnerDetailsData();

  void initState() {
    super.initState();
    apiFetchRestaurantDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [

              CachedNetworkImage(
                imageUrl: partnerDetails.avatar ?? "",

                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                const Center(
                    child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) =>
                    Image.asset(ConstanceData.h52,fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 60, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                      height: 35,
                        width: 35,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(width: 1,color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
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
                        ),
                        child: Image.asset(
                          ConstanceData.h20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                        ),
                        child: Image.asset(
                          ConstanceData.h47,
                          height: 35,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 130, left: 15, right: 15),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.isLightTheme
                                  ? Color.fromARGB(
                                  255, 231, 231, 231)
                                  : Colors.transparent,
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                          color: Theme.of(context).cardColor,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    partnerDetails.name ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: 14,
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Open Right Now",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .primaryColor,
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    partnerDetails.timeZone ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .disabledColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(height: 20,
                                    child: RatingBarIndicator(
                                      rating: partnerDetails.rating?.totalRating != null && partnerDetails.rating?.totalRating != 0 ? partnerDetails.rating!.totalRating!.toDouble():0.0,
                                      itemCount: 5,
                                      itemSize: 15.0,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${partnerDetails.distance ?? "0km"} away",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .disabledColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      var url = 'tel:${partnerDetails.phone}';
                                      UtilsFunctions.launchScreen(url);
                                    },
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                            radius: 25,
                                            child: Image.asset(
                                              ConstanceData.h48,
                                              height: 20,
                                            ),
                                            backgroundColor:
                                            HexColor("F7F6FB")),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Call",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.bold,
                                              color: Theme.of(
                                                  context)
                                                  .disabledColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              RestaurantsSearchForRestaurants(),
                                        ),
                                      );

                                    },
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                            radius: 25,
                                            child: Image.asset(
                                              ConstanceData.h49,
                                              height: 20,
                                            ),
                                            backgroundColor:
                                            HexColor("F7F6FB")),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Directions",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              color: Theme.of(
                                                  context)
                                                  .disabledColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 25,
                                          child: Image.asset(
                                            ConstanceData.h50,
                                            height: 20,
                                          ),
                                          backgroundColor:
                                          HexColor("F7F6FB")),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Coupons",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.bold,
                                            color: Theme.of(
                                                context)
                                                .disabledColor),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            "POPULAR",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
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
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  partnerDetails.description ?? "",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                if(partnerDetails.products != null && partnerDetails.products!.isNotEmpty)
               SizedBox(height:150,
                 child: ListView(
                   scrollDirection: Axis.horizontal,
                   shrinkWrap: true,
                   children: [
                     for(var i=0;i<partnerDetails.products!.length;i++)
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           height: 150,width: 150,
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
                             padding: const EdgeInsets.all(15),
                             child: Column(
                               children: [
                                 CachedNetworkImage(
                                   imageUrl: partnerDetails.products?[i].productimage ?? "",
                                   height: 80,
                                   fit: BoxFit.cover,
                                   placeholder: (context, url) =>
                                   const Center(
                                       child: CircularProgressIndicator()),
                                   errorWidget:
                                       (context, url, error) =>
                                       Container(padding:EdgeInsets.all(8),child: Image.asset(ConstanceData.h52,fit: BoxFit.contain,)),
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 Text(
                                   partnerDetails.products?[i].name ?? "",
                                   style: Theme.of(context)
                                       .textTheme
                                       .bodyLarge!
                                       .copyWith(
                                     fontSize: 10,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                    
                   ],
                 ),
               ),

                SizedBox(
                  height: 20,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  apiFetchRestaurantDetails() async {
    await ApiManager().getPartnerDetails(partnerId: widget.partnerId).then((value) {
      if(value != null){
        partnerDetails = value;
        print("this is partner details: ${partnerDetails}");
        setState(() {});
      }
    });
  }
}
