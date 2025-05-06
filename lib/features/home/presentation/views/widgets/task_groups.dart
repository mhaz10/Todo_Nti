import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import 'custom_task_groups.dart';

class TaskGroups extends StatelessWidget {
  const TaskGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTaskGroups(taskTitle: 'Personal Task', taskCount: 3, taskIcon: kPersonalIcon),
        const SizedBox(height: 20,),
        CustomTaskGroups(taskTitle: 'Home Task', taskCount: 5, taskIcon: kHomeIcon),
        const SizedBox(height: 20,),
        CustomTaskGroups(taskTitle: 'Work Task', taskCount: 7, taskIcon: kWorkIcon),
      ],
    );
  }
}