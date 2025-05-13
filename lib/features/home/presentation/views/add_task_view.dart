import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.arrowLeftIcon),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Add Task'),
      ),
      body: AddTaskViewBody(),
    );
  }
}
