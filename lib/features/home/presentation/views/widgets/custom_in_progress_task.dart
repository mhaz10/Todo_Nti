import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';

import '../../../../../core/utils/text_styles.dart';

class CustomInProgressTask extends StatelessWidget {
  const CustomInProgressTask({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.taskColor,
    required this.taskIcon,
    required this.taskTitleColor,
    required this.taskDescriptionColor,
  });

  final String taskTitle;
  final String taskDescription;
  final int taskTitleColor;
  final int taskDescriptionColor;
  final int taskColor;
  final String taskIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.width(context, value: 234),
      height: AppResponsive.height(context, value: 99),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(taskColor),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                taskTitle,
                style: TextStyles.textStyle12.copyWith(
                  color: Color(taskTitleColor),
                ),
              ),
              Spacer(),
              SvgPicture.asset(taskIcon),
            ],
          ),
          Expanded(
            child: Text(
              taskDescription,
              style: TextStyles.textStyle14.copyWith(
                color: Color(taskDescriptionColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
