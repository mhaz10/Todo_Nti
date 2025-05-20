import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, required this.color, this.onTap, this.isActive = true, this.isLoading = false, this.textColor = AppColors.white});

  final Function()? onTap;
  final bool isActive;
  final bool isLoading;
  final String? text;
  final Color color;
  final Color textColor;

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
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(child: isLoading ? LoadingAnimationWidget.inkDrop(color: Colors.white, size: 30,) : Text(text!, style: TextStyles.textStyle20.copyWith(
          color: textColor
        ))),
      ),
    );
  }
}