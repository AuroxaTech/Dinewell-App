
import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Splash/onboarding.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/auth/14_welcome_back_step_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class WelComeScreen extends StatefulWidget {
  const WelComeScreen({super.key});

  @override
  State<WelComeScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Image.asset(
              ConstanceData.logo4,fit: BoxFit.contain,width: context.width,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Join Us Today and Win \n3 Exclusive Rewards ",
            textAlign: TextAlign.center,

            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Eat out & Order food from your favourite restaurants\nand earn points that can be redeemed\nfor exclusive offers!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12,
              color: Theme.of(context).disabledColor,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: MyButton(
                btnName: "Get Started",
                click: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OnBoardingScreen(),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WelcomeBakeStep1Screen(),
                    ),
                  );
                },
                child: Text(
                  " Sign In",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
