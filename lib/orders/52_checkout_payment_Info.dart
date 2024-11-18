import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Orders/53_checkout_order_placed.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:flutter/material.dart';

class CheckoutPaymentInfoScreen extends StatefulWidget {
  const CheckoutPaymentInfoScreen({super.key});

  @override
  State<CheckoutPaymentInfoScreen> createState() =>
      _CheckoutPaymentInfoScreenState();
}

class _CheckoutPaymentInfoScreenState extends State<CheckoutPaymentInfoScreen> {

  TextEditingController cardTextController = TextEditingController();
  TextEditingController cardHolderTextController = TextEditingController();
  TextEditingController expiredTextController = TextEditingController();
  TextEditingController cvvTextController = TextEditingController();

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
                  "Step 3/4",
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
              height: 40,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Image.asset(
                    ConstanceData.r43,
                    height: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What is Your Payment Method?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CHOOSE YOUR PAYMENT METHOD",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 8,
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.r44,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.r45,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.r46,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    ConstanceData.r47,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "PAYMENT DETAILS",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 8,
                                      color: Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MyTextField(
                              controller: cardTextController,
                              hintText: "CARD’S NUMBER",
                              labelText: "0000 - 0000 - 0000 - 0000",
                              click: () {},
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            MyTextField(
                              controller: cardHolderTextController,
                              hintText: "CARDHOLDER’S NAME",
                              labelText: "Example: John Smith",
                              click: () {},
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyTextField(
                                    controller: expiredTextController,
                                    hintText: "EXPIRATION DATE",
                                    labelText: "Example: 20/02",
                                    click: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: MyTextField(
                                    controller: cvvTextController,
                                    hintText: "CVV",
                                    labelText: "Ex: 680",
                                    click: () {},
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            MyButton(
                btnName: "Pay \$14.50",
                click: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutOrderPlacedScreen(),
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
