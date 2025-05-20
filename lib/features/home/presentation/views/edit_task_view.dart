import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:todo_app_nti/core/utils/app_toast.dart';
import 'package:todo_app_nti/features/home/data/models/tasks_model.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/edit_task_view_body.dart';

import '../../../../core/cache/cache_data.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/translation/translation_keys.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/text_styles.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.task});

  final SingleTaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
       if (state is DeleteTaskSuccessState) {
         AppToast.showSuccessToast(state.message);
          Navigator.pop(context);
       } else if (state is DeleteTaskFailureState) {
         AppToast.showErrorToast(state.error);
       } else if (state is UpdateTaskSuccessState) {
         AppToast.showSuccessToast(state.tasks.message!);
       } else if (state is UpdateTaskFailureState) {
         AppToast.showErrorToast(state.error);
       }
      },
      child: PopScope(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(TranslationKeys.editTask.tr),
            centerTitle: true,
            leading: IconButton(
              icon: SvgPicture.asset(
                CacheData.lang == CacheKeys.keyEN
                    ? AppIcons.arrowLeftIcon
                    : AppIcons.arrowRightIcon,
              ),
              onPressed: () {
                UserCubit.get(context).getTasks();
                Navigator.pop(context);
              },
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  PanaraConfirmDialog.show(
                    context,
                    title: 'Are you sure?',
                    message:
                        'Do you want to delete this task? You will not be able to undo this action.',
                    confirmButtonText: "Yes",
                    cancelButtonText: "No",
                    onTapCancel: () {
                      Navigator.pop(context);
                    },
                    onTapConfirm: () {
                      UserCubit.get(context).deleteTasks(id: task.id!);
                    },
                    panaraDialogType: PanaraDialogType.error,
                    barrierDismissible: false,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.deleteIcon),
                      SizedBox(width: 5),
                      Text(
                        TranslationKeys.delete.tr,
                        style: TextStyles.textStyle14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: EditTaskViewBody(task: task),
        ),
      ),
    );
  }
}
