import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';

import '../../../../../core/utils/text_styles.dart';

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
          style: TextStyles.textStyle16,),
        const SizedBox(height: 30,),
        Image.asset(AppAssets.emptyTasks)
      ],
    );
  }
}