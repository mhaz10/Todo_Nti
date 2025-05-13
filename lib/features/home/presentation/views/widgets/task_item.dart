import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      width: AppResponsive.width(context, value: 334),
      height: AppResponsive.height(context, value: 90),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            height: AppResponsive.height(context, value: 60),
            width: AppResponsive.width(context, value: 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(AppAssets.user),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withAlpha(64),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                )
              ]
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Go to supermarket to buy some milk & eggs', style: TextStyles.textStyle14),
                const SizedBox(height: 4,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFCEEBDC),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text('In Progress', style: TextStyles.textStyle12),
                      ),
                      SvgPicture.asset(AppIcons.homeIcon, width: 5, height: 5,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}