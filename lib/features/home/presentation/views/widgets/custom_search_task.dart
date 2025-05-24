import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';
import '../../../../../core/translation/translation_keys.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';

class CustomSearchTask extends StatelessWidget {
  const CustomSearchTask({super.key, this.onChanged});

  final void Function(String)? onChanged;

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
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: TranslationKeys.search.tr,
          hintStyle: TextStyle(color: AppColors.grey, fontSize: 14),
          suffixIcon: SvgPicture.asset(
            AppIcons.searchTaskIcon,
            width: 4,
            height: 4,
            fit: BoxFit.none,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
