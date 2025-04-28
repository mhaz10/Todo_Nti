import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/utils/styles.dart';

import '../../../../../core/constants/constants.dart';

class TasksBuilderFailure extends StatelessWidget {
  const TasksBuilderFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30,),
        const Text(
          'There are no tasks yet, \n Press the button \n To add New Task ',
          textAlign: TextAlign.center,
          style: Styles.textStyle16,),
        const SizedBox(height: 30,),
        Image.asset(kEmptyTasksImage)
      ],
    );
  }
}