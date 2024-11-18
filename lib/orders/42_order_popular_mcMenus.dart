import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Orders/43_order_recent_searches.dart';
import 'package:dinewell/Orders/46_order_customize_product.dart';
import 'package:flutter/material.dart';

class OrderPopularMcMenusScreen extends StatefulWidget {
  const OrderPopularMcMenusScreen({super.key});

  @override
  State<OrderPopularMcMenusScreen> createState() =>
      _OrderPopularMcMenusScreenState();
}

class _OrderPopularMcMenusScreenState extends State<OrderPopularMcMenusScreen> {
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
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => orderRecentSearchesScreen(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                ConstanceData.r10,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Popular McMenus",
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
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(
                      left: 18,
                      right: 18,
                      bottom: MediaQuery.of(context).padding.bottom + 16,
                      top: 16),
                  children: [
                    Row(
                      children: [
                        com(ConstanceData.r11, "Big Mac", "The Classic",
                            "\$5.99"),
                        SizedBox(
                          width: 10,
                        ),
                        com(ConstanceData.r12, "Artisan Grilled", "The Healthy",
                            "\$6.99"),
                        SizedBox(
                          width: 10,
                        ),
                        com(ConstanceData.r13, "Crispy Chicken", "The Tasty",
                            "\$5.50"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        com(ConstanceData.r25, "CheeseBurger",
                            "Simple as That", "\$4.99"),
                        SizedBox(
                          width: 10,
                        ),
                        com(ConstanceData.r26, "McNuggets", "Chicken Nuts!",
                            "\$4.99"),
                        SizedBox(
                          width: 10,
                        ),
                        com(ConstanceData.r27, "CheesePonder", "Say Cheese!",
                            "\$4.99"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      ConstanceData.r28,
                                      height: 35,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Filet-O-Fish",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Yummy!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 10,
                                              color: Theme.of(context)
                                                  .disabledColor),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "\$4.99",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    ConstanceData.r20,
                                    height: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
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
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
    );
  }

  Widget com(String img, String tex1, String tex2, String tex3) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderCustomizeProductScreen(),
            ),
          );
        },
        child: Container(
          height: 150,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      img,
                      height: 35,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      tex1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      tex2,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 10, color: Theme.of(context).disabledColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      tex3,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    ConstanceData.r20,
                    height: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
