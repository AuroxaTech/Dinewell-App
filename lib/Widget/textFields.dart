import 'package:flutter/material.dart';
import '../Constance/colors.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool hideTextField;
  final VoidCallback click;
  final TextEditingController controller;
  final bool? obscureText;
  final bool? isEnabled;
  final int? length;
  final bool isPhoneNumber; // New parameter to enable/disable phone number validation
  void Function(String)? onChanged;

  MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled = false,
    this.keyboardType = TextInputType.text,
    this.hideTextField = false,
    required this.click,
    required this.labelText,
    this.obscureText,
    this.length,
    this.onChanged,
    this.isPhoneNumber = false, // Default is false
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align error message correctly
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            readOnly: widget.isEnabled!,
            cursorColor: Theme.of(context).primaryColor,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            maxLength: widget.isPhoneNumber ? 10 : widget.length, // Limit to 10 digits if it's a phone number
            onChanged: (value) {
              // Phone number validation logic
              if (widget.isPhoneNumber) {
                if (value.length == 10) {
                  setState(() {
                    errorMessage = null;
                  });
                }
              }
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            onTap: () {
              widget.click();
            },
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 12,
            ),
            obscureText: widget.obscureText ?? false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 16, top: 16),
              hintText: widget.hintText,
              labelText: widget.labelText,
              counterText: "",
              labelStyle: TextStyle(
                fontSize: 10,
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary, width: 1.5),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: AppColors.secondary,
                  width: 1.5,
                ),
              ),
             // errorText: widget.isPhoneNumber ? errorMessage : null, // Display error only for phone number validation
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
