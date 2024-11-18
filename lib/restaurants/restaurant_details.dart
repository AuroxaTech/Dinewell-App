import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/models/partner_details_model.dart';
import 'package:dinewell/services/api_manager.dart';
import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final String partnerId;
  const RestaurantDetailsScreen({super.key, required this.partnerId});

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {

  PartnerDetailsData partnerDetails = PartnerDetailsData();

  @override
  void initState() {
    super.initState();
    apiFetchRestaurantDetails();
  }

  @override
  Widget build(BuildContext context) {
    print("Partner Id ===> ${widget.partnerId}");
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        ConstanceData.h5,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
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
                              Image.asset(
                                ConstanceData.h21,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: partnerDetails.avatar ?? "",
                              height: 150,
                              width: MediaQuery.of(context).size.width ,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                              const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget:
                                  (context, url, error) =>
                                   Container(child: Image.asset(ConstanceData.h52, fit: BoxFit.fill,width: MediaQuery.of(context).size.width ,)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(
                      left: 18,
                      right: 18,
                      bottom: MediaQuery.of(context).padding.bottom + 16),
                  children: [
                    Text(
                      partnerDetails.name?.toUpperCase() ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "DESCRIPTION",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                        partnerDetails.description ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PRODUCTS",
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if(partnerDetails.products != null && partnerDetails.products!.isNotEmpty)
                      ListView(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          for(var i=0;i<partnerDetails.products!.length;i++)
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              // height: 110,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.isLightTheme
                                        ? const Color.fromARGB(
                                        255, 231, 231, 231)
                                        : Colors.transparent,
                                    blurRadius: 2.0,
                                    spreadRadius: 2.0,
                                    offset: const Offset(0.0, 0.0),
                                  )
                                ],
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                         left: 15),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: partnerDetails.products?[i].productimage ??
                                              "",
                                          height: 70,
                                          width: 70,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                          const Center(
                                              child:
                                              CircularProgressIndicator()),
                                          errorWidget:
                                              (context, url, error) =>
                                              Container(
                                                color:
                                                Colors.grey,
                                                child:
                                                const Icon(Icons.error),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: (MediaQuery.of(context)
                                        .size
                                        .width -
                                        50) /
                                        2,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            partnerDetails.products?[i].name ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),

                                          Text(
                                            partnerDetails.products?[i].description ?? "",
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            )

                        ],
                      ),

                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
