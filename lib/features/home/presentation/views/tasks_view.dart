import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/utils/styles.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_view_body.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(kArrowBackIcon),
          onPressed: () {
            GoRouter.of(context).pop(context);
          },
        ),
        title: Text('Tasks', style: Styles.textStyle20,),
        centerTitle: true,
      ),
      body: TasksViewBody(),
    );
  }
}
