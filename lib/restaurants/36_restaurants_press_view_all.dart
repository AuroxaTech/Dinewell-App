import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Restaurants/37_order_nearby_restaurants_filter2.dart';
import 'package:dinewell/Restaurants/41_order_available_products.dart';
import 'package:flutter/material.dart';

class RestaurantsPressViewAll2Screen extends StatefulWidget {
  const RestaurantsPressViewAll2Screen({super.key});

  @override
  State<RestaurantsPressViewAll2Screen> createState() =>
      _RestaurantsPressViewAll2ScreenState();
}

class _RestaurantsPressViewAll2ScreenState
    extends State<RestaurantsPressViewAll2Screen> {
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OrderFilter2Screen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            ConstanceData.h30,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nearby Restaurants",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              children: [
                SizedBox(
                  height: 30,
                ),
                com(ConstanceData.s19, "Starbucks", "Best Offers",
                    "Tillary Street, Brooklyn, NY", "(895 reviews)"),
                SizedBox(
                  height: 30,
                ),
                com(ConstanceData.s27, "Burger King", "Best Offers",
                    "Johnston Street, Brooklyn, NY", "(548 reviews)"),
                SizedBox(
                  height: 30,
                ),
                com(ConstanceData.s26, "Wendy’s", "New Offers",
                    "Duffield Street, Brooklyn, NY", "(491 reviews)"),
                SizedBox(
                  height: 30,
                ),
                com(ConstanceData.s21, "Domino’s", "New Offers",
                    "Concord Street, Brooklyn, NY", "(699 reviews)"),
                SizedBox(
                  height: 30,
                ),
                com(ConstanceData.s22, "McDonald’s", "Best Offers",
                    "Flat Bush Street, Brooklyn, NY", "(946 reviews)"),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget com(String img, String tex1, String tex2, String tex3, String tex4) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderAvailableProductsScreen(),
          ),
        );
      },
      child: Container(
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
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                img,
                height: 60,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tex1,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            tex2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        tex3,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 10,
                            color: Theme.of(context).disabledColor),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Image.asset(
                        ConstanceData.h44,
                        height: 15,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        ConstanceData.h12,
                        height: 10,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        tex4,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 10,
                            color: Theme.of(context).disabledColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
