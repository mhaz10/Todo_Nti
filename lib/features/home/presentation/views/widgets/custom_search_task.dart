import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';

class CustomSearchTask extends StatelessWidget {
  const CustomSearchTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: AppResponsive.width(context, value: 331),
        height: AppResponsive.height(context, value: 45),
        child: TextField(
          cursorColor: AppColors.grey,
          onChanged: (value) {
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
            suffixIcon: SvgPicture.asset(AppIcons.settingIcon, width: 4, height: 4, fit: BoxFit.none,),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ));
  }
}