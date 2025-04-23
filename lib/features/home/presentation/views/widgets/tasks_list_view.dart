import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const TaskItem(),
          separatorBuilder: (context, index) => const SizedBox(height: 20,),
          itemCount: 10
      ),
    );
  }
}