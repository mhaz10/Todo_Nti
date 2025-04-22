import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.hintText, this.isPassword = false});

  final String hintText;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: isObscure,
        cursorColor: Color(0xFFCDCDCD),
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.isPassword ? IconButton(onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          }, icon: isObscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off)) : null,
          hintStyle: const TextStyle(
            color: Color(0xFF939393),
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Color(0xFFCDCDCD),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Color(0xFFCDCDCD),
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}