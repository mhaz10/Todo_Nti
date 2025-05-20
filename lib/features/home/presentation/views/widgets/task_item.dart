import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/home/data/models/tasks_model.dart';
import 'package:todo_app_nti/features/home/presentation/views/edit_task_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final SingleTaskModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.goTo(screen: EditTaskView(task: task,));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        width: AppResponsive.width(context, value: 334),
        height: AppResponsive.height(context, value: 90),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            if (task.imagePath != null)
            Container(
              height: AppResponsive.height(context, value: 60),
              width: AppResponsive.width(context, value: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(task.imagePath),
                ),
              ),
            ),
            if (task.imagePath != null)
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title!, style: TextStyles.textStyle14),
                  const SizedBox(height: 4,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text('In Progress', style: TextStyles.textStyle12),
                        ),
                        SizedBox(width: 5,),
                        SvgPicture.asset(AppIcons.homeIcon,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}