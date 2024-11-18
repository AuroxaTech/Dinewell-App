import 'package:flutter/material.dart';

class myTextField2 extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final VoidCallback click;

  const myTextField2({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.click,
  });

  @override
  State<myTextField2> createState() => _myTextField2State();
}

class _myTextField2State extends State<myTextField2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        onTap: () {
          widget.click();
        },
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12,
            ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 16, top: 16),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.5))),
      ),
    );
  }
}
