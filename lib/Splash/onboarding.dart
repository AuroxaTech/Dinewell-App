import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/auth/3_what_is_your_name_step_1.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageNumber = 0;

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {},
              children: [
                onBoarding1(),
                onBoarding2(),
                onBoarding3(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
            child: MyButton(
                btnName: "Continue",
                click: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WhatIsYourNameStep1Screen(),
                    ),
                  );
                }),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WhatIsYourNameStep1Screen(),
                ),
              );
            },
            child: Text(
              "Skip",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget onBoarding1() {
    return Column(
      children: [
        Image.asset(
          ConstanceData.s35,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome!",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Find your favorite restaurants and win \npoints and amazing rewards for\neach purchase.",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 12, color: Theme.of(context).disabledColor),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget onBoarding2() {
    return Column(
      children: [
        Image.asset(
          ConstanceData.s36,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Collect Points in a Single App!",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Collect points with each purchase and\nexchange them for exclusive\nrewards!",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 12, color: Theme.of(context).disabledColor),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget onBoarding3() {
    return Column(
      children: [
        Image.asset(
          ConstanceData.s37,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Exclusive Offers and Rewards!",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "We offer amazing and exclusive rewards\nand coupons that you can only\nfind in here!",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 12, color: Theme.of(context).disabledColor),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
