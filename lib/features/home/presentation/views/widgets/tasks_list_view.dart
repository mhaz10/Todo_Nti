import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/auth/data/models/login_model.dart';
import 'package:todo_app_nti/features/home/data/models/tasks_model.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key, required this.tasks});

  final List<SingleTaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, left: 18, right: 18),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => TaskItem(task: tasks[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 20,),
          itemCount: tasks.length
      ),
    );
  }
}