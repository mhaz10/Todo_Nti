import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';

import '../../../../../core/utils/text_styles.dart';

class CustomTaskGroups extends StatelessWidget {
  const CustomTaskGroups({super.key, required this.taskTitle, required this.taskCount, required this.taskIcon});

  final String taskTitle;
  final String taskIcon;
  final int taskCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: AppResponsive.width(context, value: 334),
      height: AppResponsive.height(context, value: 62),
      child: Row(
        children: [
          SvgPicture.asset(taskIcon),
          const SizedBox(width: 10,),
          Text(taskTitle, style: TextStyles.textStyle14,),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              color: Color(0xFFCEEBDC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('$taskCount'),
          )
        ],
      ),
    );
  }
}