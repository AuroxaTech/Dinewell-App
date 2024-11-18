import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Orders/44_order_search_results.dart';
import 'package:dinewell/Widget/textFields2.dart';
import 'package:flutter/material.dart';

class orderRecentSearchesScreen extends StatefulWidget {
  const orderRecentSearchesScreen({super.key});

  @override
  State<orderRecentSearchesScreen> createState() =>
      _orderRecentSearchesScreenState();
}

class _orderRecentSearchesScreenState extends State<orderRecentSearchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      ConstanceData.r19,
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
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "Search",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          myTextField2(
                            hintText: "Search for any products",
                            prefixIcon: IconButton(
                              icon: Image.asset(
                                ConstanceData.r30,
                                height: 15,
                              ),
                              onPressed: () {},
                            ),
                            suffixIcon: IconButton(
                              icon: Image.asset(
                                ConstanceData.r31,
                                height: 20,
                              ),
                              onPressed: () {},
                            ),
                            click: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OrderSearchResultsScreen(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OrderSearchResultsScreen(),
                        ),
                      );
                    },
                    child: ListView(
                      padding: EdgeInsets.only(
                          left: 18,
                          right: 18,
                          bottom: MediaQuery.of(context).padding.bottom + 16),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "RECENT SEARCHES",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Artisan Grilled Chicken Sandwich Meal",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context).disabledColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Popular McMenus",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                  ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Chocolate Chip Cookies",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context).disabledColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Desserts and Shakes",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                  ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Big Mac Menu",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context).disabledColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Popular McMenus",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
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
                            borderRadius: BorderRadius.all(Radius.circular(30)),
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
            )
          ],
        ),
      ),
    );
  }
}
