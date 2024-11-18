import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/page_view.dart';
import 'package:dinewell/home/location_fetch_page.dart';
import 'package:flutter/material.dart';

class PasswordRestoreScreen extends StatefulWidget {
  const PasswordRestoreScreen({super.key});

  @override
  State<PasswordRestoreScreen> createState() => _PasswordRestoreScreenState();
}

class _PasswordRestoreScreenState extends State<PasswordRestoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              ConstanceData.s31,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Your Password Has Been\nRestored Successfully!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "You can now order food from your favorite\nrestaurants with multiple advantages\nwithout losing any offer.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor,
                    ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MyButton(
                    btnName: "Get Started",
                    click: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LocationFetchPage(),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
