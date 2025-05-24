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

import '../../../data/models/tasks_model.dart';

class TasksViewBody extends StatefulWidget {
  const TasksViewBody({super.key});

  @override
  State<TasksViewBody> createState() => _TasksViewBodyState();
}

class _TasksViewBodyState extends State<TasksViewBody> {
  List<SingleTaskModel> searchedTasks = [];

  void searchTask(String query) {
    final filtered =
    UserCubit.get(context).tasks.where((task) {
      final title = task.title?.toLowerCase() ?? '';
      final description = task.description?.toLowerCase() ?? '';
      return title.contains(query.toLowerCase()) ||
          description.contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchedTasks = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (UserCubit.get(context).tasks.isNotEmpty) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CustomSearchTask(
                    onChanged: (value) {
                      searchTask(value);
                    },
                  ),
                  const SizedBox(height: 30,),
                  TaskCounter(
                    taskTitle: TranslationKeys.results.tr, taskCount: searchedTasks.isNotEmpty ? searchedTasks.length : UserCubit.get(context).tasks.length,),
                  const SizedBox(height: 30,),
                  TasksListView(
                    tasks: searchedTasks.isNotEmpty ? searchedTasks : UserCubit.get(context).tasks,
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



