import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/home/data/models/in_progress_task_model.dart';

import 'custom_in_progress_task.dart';

class CustomListViewInProgressTasks extends StatefulWidget {
  const CustomListViewInProgressTasks({super.key});

  @override
  State<CustomListViewInProgressTasks> createState() =>
      _CustomListViewInProgressTasksState();
}

class _CustomListViewInProgressTasksState
    extends State<CustomListViewInProgressTasks> {
  final List<InProgressTaskModel> inProgressTasks = [
    InProgressTaskModel(
      taskTitle: 'Work Task',
      taskDescription: 'Add New Features',
      taskColor: 0xFF1D1C1B,
      taskTitleColor: 0xFFFFFFFF,
      taskDescriptionColor: 0xFFFFFFFF,
      taskIcon: AppIcons.workIcon,
    ),
    InProgressTaskModel(
      taskTitle: 'Personal Task',
      taskDescription: 'Improve my English skills by trying to speek',
      taskColor: 0xFFCEEBDC,
      taskTitleColor: 0xFF6E6A7C,
      taskDescriptionColor: 0xFF24252C,
      taskIcon: AppIcons.personalIcon,
    ),
    InProgressTaskModel(
      taskTitle: 'Home Task',
      taskDescription: 'Add new feature for Do It app and commit it',
      taskColor: 0xFFFFE4F2,
      taskTitleColor: 0xFF6E6A7C,
      taskDescriptionColor: 0xFF24252C,
      taskIcon: AppIcons.homeIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.height(context, value: 99),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => CustomInProgressTask(
              taskTitle: inProgressTasks[index].taskTitle,
              taskDescription: inProgressTasks[index].taskDescription,
              taskColor: inProgressTasks[index].taskColor,
              taskIcon: inProgressTasks[index].taskIcon,
              taskTitleColor: inProgressTasks[index].taskTitleColor,
              taskDescriptionColor: inProgressTasks[index].taskDescriptionColor,
            ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 3,
      ),
    );
  }
}
