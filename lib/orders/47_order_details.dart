import 'package:cached_network_image/cached_network_image.dart';
import 'package:dinewell/Constance/colors.dart';
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Orders/49_order_confirm_your_order.dart';
import 'package:dinewell/Orders/practice.dart';
import 'package:dinewell/Restaurants/restaurant_details.dart';
import 'package:dinewell/models/all_partners_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderDetailScreen extends StatefulWidget {
  final List<AllPartnersListData> partnersList;
   OrderDetailScreen({super.key, required this.partnersList});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    ConstanceData.h29,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 20, right: 20),
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
                            Image.asset(
                              ConstanceData.h21,
                              height: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Order Details",
                              style:Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: /*ListView(
                  padding: EdgeInsets.only(
                      left: 18,
                      right: 18,
                      bottom: MediaQuery.of(context).padding.bottom + 16),
                  children: [
                    com(
                        ConstanceData.r33,
                        "Big Mac Menu",
                        "Size: Normal\nQuantity: x1\nCustomization\n  No pickles",
                        "\$12.50"),
                    SizedBox(
                      height: 30,
                    ),
                    com(
                        ConstanceData.r38,
                        "Double Cheeseburger",
                        "Size: Double\nQuantity: x1\nCustomization\n  No onions",
                        "\$2.00")
                  ],
                ),*/ ListView(
                  padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15,top:20),
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    for (var index = 0;
                    index < widget.partnersList.length;
                    index++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RestaurantDetailsScreen(
                                        partnerId:
                                        widget.partnersList[index]
                                            .id ??
                                            "")),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(

                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)),
                          ),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 0, left: 15, right: 5),
                                child: Container(
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: widget.partnersList[index]
                                          .avatar ??
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
                                            Theme.of(context).primaryColor,
                                            child:
                                            const Icon(Icons.error),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 95,
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
                                          widget.partnersList[index]
                                              .name ??
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
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          child: RatingBarIndicator(
                                            rating: widget.partnersList[
                                            index]
                                                .rating
                                                ?.totalRating !=
                                                null &&
                                                widget.partnersList[
                                                index]
                                                    .rating
                                                    ?.totalRating !=
                                                    0
                                                ? widget.partnersList[
                                            index]
                                                .rating!
                                                .totalRating!
                                                .toDouble()
                                                : 0.0,
                                            itemCount: 5,
                                            itemSize: 15.0,
                                            physics:
                                            BouncingScrollPhysics(),
                                            itemBuilder:
                                                (context, _) =>
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding:
                                          EdgeInsets.fromLTRB(
                                              8, 5, 8, 5),
                                          decoration: BoxDecoration(
                                              color: AppColors
                                                  .primaryBgColor
                                                  .withOpacity(0.5),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors
                                                      .primaryBgColor
                                                      .withOpacity(
                                                      0.5)),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  12)),
                                          child: Text(
                                            "BEST OFFERS",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                fontSize: 8,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 90,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: AppColors.secondary,
                                          size: 15,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              top: 3, right: 5),
                                          child: Text(
                                            "${widget.partnersList[index].distance ?? "0 km"} away",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                fontSize: 8,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 12,
                                    // ),
                                    // Spacer(),
                                    // Container(
                                    //   padding: EdgeInsets.only(right: 4),
                                    //   child: Icon(
                                    //     Icons.favorite,
                                    //     color: Colors.white,
                                    //     size: 20,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                )
              )
            ],
          ),
         /* Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount :   \$14.50",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OrderConfirmYourOrderScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order From",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "McDonald’s - Flat Bush Street",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 2,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        ConstanceData.r24,
                        height: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "0 items",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )*/
        ],
      ),
    );
  }

  Widget com(String img, String tex1, String tex2, String tex3) {
    return Slidable(
      key: const ValueKey(1),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: doNothing,
            backgroundColor: HexColor("#FF7474"),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
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
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(children: [
                    Image.asset(
                      img,
                      height: 70,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Center(
                            child: Text(
                              "-",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "1",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Center(
                            child: Text(
                              "+",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tex1,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        tex2,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 10,
                            color: Theme.of(context).disabledColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        tex3,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                ConstanceData.r37,
                height: 30,
              ),
              Text(
                "Edit Menu",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
