import 'package:dinewell/Constance/constance.dart';
import 'package:dinewell/Constance/theme.dart';
import 'package:dinewell/Widget/buttons.dart';
import 'package:dinewell/Widget/textFields.dart';
import 'package:dinewell/auth/18_password.dart';
import 'package:flutter/material.dart';

class SetYourNewPasswordStepScreen extends StatefulWidget {
  const SetYourNewPasswordStepScreen({super.key});

  @override
  State<SetYourNewPasswordStepScreen> createState() =>
      _SetYourNewPasswordStepScreenState();
}

class _SetYourNewPasswordStepScreenState
    extends State<SetYourNewPasswordStepScreen> {

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

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
                  "Step 3/3",
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
                    ConstanceData.s14,
                    height: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Set Your New Password",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Try to create a new password that you \nwill remember.",
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
                    padding: const EdgeInsets.all(4.0),
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
                            MyTextField(
                              controller: passwordTextController,
                              hintText: "PASSWORD",
                              labelText: "PASSWORD",
                              prefixIcon: IconButton(
                                icon: Image.asset(
                                  ConstanceData.s15,
                                  height: 15,
                                ),
                                onPressed: () {},
                              ),
                              suffixIcon: IconButton(
                                icon: Image.asset(
                                  ConstanceData.s6,
                                  height: 20,
                                ),
                                onPressed: () {},
                              ),
                              click: () {},
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            MyTextField(
                              controller: confirmPasswordTextController,
                              hintText: "CONFIRM PASSWORD",
                              labelText: "CONFIRM PASSWORD",
                              prefixIcon: IconButton(
                                icon: Image.asset(
                                  ConstanceData.s15,
                                  height: 15,
                                ),
                                onPressed: () {},
                              ),
                              suffixIcon: IconButton(
                                icon: Image.asset(
                                  ConstanceData.s6,
                                  height: 20,
                                ),
                                onPressed: () {},
                              ),
                              click: () {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "YOUR PHONE NUMBER MUST CONTAIN",
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
                                Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Between 8 and 20 characters",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 8,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1 upper case letter",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 8,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1 upper case letter",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 8,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ConstanceData.s13,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1 or more special character",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 8,
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyButton(
                btnName: "Next Step",
                click: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PasswordRestoreScreen(),
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

class CommonScreen extends StatefulWidget {
  const CommonScreen({super.key});

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("return")],
      ),
    );
  }
}
