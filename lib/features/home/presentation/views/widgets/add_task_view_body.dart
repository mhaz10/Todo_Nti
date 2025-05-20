import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/core/utils/app_toast.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';
import 'package:todo_app_nti/core/widgets/image_picker/image_manager_view.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';
import 'custom_drop_down.dart';
import 'custom_task_field.dart';
import 'data_time_card.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? groupValue;
  String? selectedDate;
  String? selectedTime;
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
       if (state is AddNewTaskSuccessState) {
          AppToast.showSuccessToast(state.message);
          Navigator.pop(context);
        } else if (state is AddNewTaskFailureState) {
         AppToast.showErrorToast(state.error);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageManagerView(
                onPicked: (image) {
                  this.image = image;
                },
                unPickedBody: Container(
                  width: AppResponsive.width(context, value: 300),
                  height: AppResponsive.width(context, value: 240),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add, size: 50,),
                ),
              ),
              const SizedBox(height: 30),
              CustomTaskField(
                hintText: TranslationKeys.title.tr,
                maxLines: 1,
                controller: titleController,
              ),
              const SizedBox(height: 20),
              CustomTaskField(
                hintText: TranslationKeys.description.tr,
                controller: descriptionController,
              ),
              const SizedBox(height: 20),
              CustomDropdown(
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              DateTimeCard(
                onDateTimeSelected: (date, time) {
                  setState(() {
                    selectedDate = date;
                    selectedTime = time;
                  });
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: TranslationKeys.addTask.tr,
                color: AppColors.primary,
                isActive: isActive(),
                onTap: () {
                  if (isActive()) {
                    UserCubit.get(context).addNewTask(title: titleController.text, description: descriptionController.text, image: image);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isActive() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        groupValue != null &&
        selectedDate != null &&
        selectedTime != null) {
      return true;
    }

    return false;
  }
}
