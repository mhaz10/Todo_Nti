import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'custom_task_groups.dart';

class TaskGroups extends StatelessWidget {
  const TaskGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTaskGroups(taskTitle: TranslationKeys.personalTask.tr, taskCount: 0, taskIcon: AppIcons.personalIcon),
        const SizedBox(height: 20,),
        CustomTaskGroups(taskTitle: TranslationKeys.homeTask.tr, taskCount: 0, taskIcon: AppIcons.homeIcon),
        const SizedBox(height: 20,),
        CustomTaskGroups(taskTitle: TranslationKeys.workTask.tr, taskCount: 0, taskIcon: AppIcons.workIcon),
      ],
    );
  }
}