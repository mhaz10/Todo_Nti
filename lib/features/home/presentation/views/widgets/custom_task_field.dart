import 'package:flutter/material.dart';

class CustomTaskField extends StatelessWidget {
  const CustomTaskField({super.key, required this.hintText, this.maxLines, this.controller});

  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        cursorColor: Color(0xFFCDCDCD),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF939393),
            fontSize: 14,
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
