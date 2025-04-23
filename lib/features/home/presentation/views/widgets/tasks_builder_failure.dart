import 'package:flutter/material.dart';

class TasksBuilderFailure extends StatelessWidget {
  const TasksBuilderFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('There are no tasks yet, \n Press the button \n To add New Task ', textAlign: TextAlign.center,),
        const SizedBox(height: 30,),
        Image.asset('kEmptyTasksImage')
      ],
    );
  }
}