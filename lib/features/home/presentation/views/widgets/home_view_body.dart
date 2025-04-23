import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_builder_success.dart';

import '../../../../../core/constants/constants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: TasksBuilderSuccess(),
    );
  }
}






