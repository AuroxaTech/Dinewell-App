import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Restaurants/31_restaurants_search_results.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:flutter/material.dart';

class RestaurantsPressSearchScreen extends StatefulWidget {
  const RestaurantsPressSearchScreen({super.key});

  @override
  State<RestaurantsPressSearchScreen> createState() =>
      _RestaurantsPressSearchScreenState();
}

class _RestaurantsPressSearchScreenState
    extends State<RestaurantsPressSearchScreen> {

  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            ConstanceData.h45,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: 380,
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        MyTextField(controller: searchTextController,
                            hintText: "Search for any restaurants",
                            click: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OrderSearchResults2Screen(),
                                ),
                              );
                            },
                            prefixIcon: IconButton(
                              icon: Image.asset(
                                ConstanceData.h42,
                                height: 15,
                              ),
                              onPressed: () {},
                            ),
                            labelText: "restaurants"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Searches",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Clear All",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Brookyln Bridge",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).dividerColor,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Downton Brooklyn, New York",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).dividerColor,
                                  ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "New York University",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).dividerColor,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "New York, NY, USA",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).dividerColor,
                                  ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Two Bridges",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).dividerColor,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Manhattan, New York, NY, USA",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).dividerColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
