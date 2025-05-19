import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';

import '../../../../../core/cache/cache_data.dart';
import '../../../../../core/cache/cache_keys.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({super.key, required this.icon, required this.text, this.onTap});

  final String icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppResponsive.width(context, value: 331),
        height: AppResponsive.height(context, value: 63),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.04),
                blurRadius: 92,
                offset: const Offset(0, 4),
              ),
            ]
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 10),
            Text(text, style: TextStyles.textStyle16),
            Spacer(),
            SvgPicture.asset(CacheData.lang ==  CacheKeys.keyEN ? AppIcons.arrowRightIcon :  AppIcons.arrowLeftIcon)
          ],
        ),
      ),
    );
  }
}