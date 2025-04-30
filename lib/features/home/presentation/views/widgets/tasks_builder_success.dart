import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_counter.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_list_view.dart';

class TasksBuilderSuccess extends StatelessWidget {
  const TasksBuilderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskCounter(taskTitle: 'Tasks', taskCount: 5,),
        const SizedBox(height: 30,),
        Expanded(
            child: TasksListView()
        )
      ],
    );
  }
}
