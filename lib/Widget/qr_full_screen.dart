import 'package:dinewell/Constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class QRFullScreenView extends StatefulWidget {
  final Widget? centerWidget;
  const QRFullScreenView({super.key, this.centerWidget});

  @override
  State<QRFullScreenView> createState() => _QRFullScreenViewState();
}

class _QRFullScreenViewState extends State<QRFullScreenView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    ConstanceData.appIcon,
                    height: 60
                ),
                SizedBox(height: 5),
                Text(
                  "\"Get Rewarded for Eating Out\"",
                  textAlign: TextAlign.center,

                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: primaryFont),
                ).paddingOnly(bottom: 30),
                Container(
                  height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: widget.centerWidget ?? Container()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
