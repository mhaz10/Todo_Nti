import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'custom_task_groups.dart';

class TaskGroups extends StatelessWidget {
  const TaskGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTaskGroups(taskTitle: 'Personal Task', taskCount: 3, taskIcon: AppIcons.personalIcon),
        const SizedBox(height: 20,),
        CustomTaskGroups(taskTitle: 'Home Task', taskCount: 5, taskIcon: AppIcons.homeIcon),
        const SizedBox(height: 20,),
        CustomTaskGroups(taskTitle: 'Work Task', taskCount: 7, taskIcon: AppIcons.workIcon),
      ],
    );
  }
}