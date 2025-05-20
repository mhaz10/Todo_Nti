import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomTaskField extends StatelessWidget {
  const CustomTaskField({super.key, required this.hintText, this.maxLines, required this.controller});

  final TextEditingController controller;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppResponsive.width(context, value: 331),
      height: AppResponsive.height(context, value: 63),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: AppColors.white,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: AppColors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: AppColors.white,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
