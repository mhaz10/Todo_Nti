import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/features/home/presentation/views/tasks_view.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_counter.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_groups.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import 'custom_list_view_in_progress_tasks.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppResponsive.width(context, value: 334),
            height: AppResponsive.height(context, value: 150),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your today’s tasks \n almost done!',
                  style: TextStyles.textStyle14.copyWith(
                  color: Colors.white,
                ),),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text('80', style: TextStyles.textStyle40,),
                    Text('%', style: TextStyles.textStyle24.copyWith(
                      color: Colors.white
                    )),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        AppNavigator.goTo(screen: TasksView());
                      },
                      child: Container(
                        width: 121,
                        height: 36,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Center(child: Text('View Tasks', style: TextStyles.textStyle14.copyWith(color: AppColors.primary),)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 30,),
          TaskCounter(taskTitle: 'In Progress', taskCount: 3,),
          const SizedBox(height: 20,),
          CustomListViewInProgressTasks(),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Task Groups'),
          ),
          const SizedBox(height: 20,),
          TaskGroups()
        ],
      ),
    );
  }
}