import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnName;
  final VoidCallback click;
  const MyButton({super.key, required this.btnName, required this.click});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        click();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: Text(
            btnName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
