import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/utils/app_router.dart';
import 'package:todo_app_nti/core/utils/styles.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_counter.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_groups.dart';

import '../../../../../core/constants/constants.dart';
import 'custom_list_view_in_progress_tasks.dart';
import 'custom_task_groups.dart';

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
            width: MediaQuery.of(context).size.width *  0.8933,
            height: MediaQuery.of(context).size.height * 0.1847,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(kButtonColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your today’s tasks \n almost done!',
                  style: Styles.textStyle14.copyWith(
                  color: Colors.white,
                ),),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text('80', style: Styles.textStyle40,),
                    Text('%', style: Styles.textStyle24.copyWith(
                      color: Colors.white
                    )),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kTasksView);
                      },
                      child: Container(
                        width: 121,
                        height: 36,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Center(child: Text('View Tasks', style: Styles.textStyle14.copyWith(color: Color(kButtonColor)),)),
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