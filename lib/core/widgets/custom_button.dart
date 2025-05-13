import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color, this.onTap, this.isActive = true});

  final Function()? onTap;
  final bool isActive;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? color : color.withAlpha(127),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isActive ? [BoxShadow(
              color: AppColors.primary.withAlpha(180),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )] : null,
        ),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),)),
      ),
    );
  }
}