import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/custom_search_task.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_counter.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_list_view.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CustomSearchTask(),
            const SizedBox(height: 30,),
            TaskCounter(taskTitle: 'Result', taskCount: 5,),
            const SizedBox(height: 30,),
            TasksListView()
          ],
        ),
      ),
    );
  }
}



