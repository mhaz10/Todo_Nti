import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.hintText, this.isPassword = false, this.controller, this.passwordToMatch});

  final TextEditingController? controller;
  final TextEditingController? passwordToMatch;
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
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isObscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          if (widget.isPassword && value.length < 6) {
            return 'Password must be at least 6 characters';
          }

          if ( widget.isPassword && widget.passwordToMatch != null && value != widget.passwordToMatch!.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        cursorColor: Color(0xFFCDCDCD),
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.isPassword ? IconButton(onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          }, icon: isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility) ) : null,
          hintStyle: const TextStyle(
            color: Color(0xFF939393),
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Color(0xFFCDCDCD),
              width: 2.0,
            ),
          ),
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