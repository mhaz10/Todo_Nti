import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/custom_search_task.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/task_counter.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_builder_failure.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/tasks_list_view.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is GetTasksSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CustomSearchTask(),
                  const SizedBox(height: 30,),
                  TaskCounter(
                    taskTitle: TranslationKeys.results.tr, taskCount: state.tasks.length,),
                  const SizedBox(height: 30,),
                  TasksListView(
                    tasks: state.tasks,
                  )
                ],
              ),
            ),
          );
        } else if (state is GetTasksFailureState) {
          return TasksBuilderFailure();
        }

        return Center(
          child: LoadingAnimationWidget.inkDrop(size: 50, color: AppColors.primary),
        );
      },
    );
  }
}



