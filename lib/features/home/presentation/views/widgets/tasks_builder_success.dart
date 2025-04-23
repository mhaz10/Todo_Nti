import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_list_view.dart';

class TasksBuilderSuccess extends StatelessWidget {
  const TasksBuilderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Tasks'),
            const SizedBox(width: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: Color(0xFFCEEBDC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '5',
              ),
            )
          ],
        ),
        const SizedBox(height: 30,),
        Expanded(
            child: TasksListView()
        )
      ],
    );
  }
}