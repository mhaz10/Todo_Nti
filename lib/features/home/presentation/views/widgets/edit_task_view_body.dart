import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';
import '../../../../../core/translation/translation_keys.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/image_picker/image_manager_view.dart';
import '../../../data/models/tasks_model.dart';
import 'custom_drop_down.dart';
import 'custom_task_field.dart';
import 'data_time_card.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key, required this.task});

  final SingleTaskModel task;

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? groupValue;
  String? selectedDate;
  String? selectedTime;
  XFile? image;

  @override
  void initState() {
    titleController.text = widget.task.title!;
    descriptionController.text = widget.task.description!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  ImageManagerView(
                    onPicked: (image) {
                     this.image = image;
                    },
                    unPickedBody: widget.task.imagePath != null
                        ? CircleAvatar(radius: 50, backgroundImage: NetworkImage(widget.task.imagePath!),)
                        : CircleAvatar(radius: 50, backgroundColor: AppColors.white ,child: Center(child: Icon(Icons.image, color: AppColors.primary,),),),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('In Progress', style: TextStyles.textStyle16),
                        const SizedBox(height: 5),
                        const Text('Believe you can, and you\'re halfway there.', style: TextStyles.textStyle16),
                      ],
                    ),
                  )
                ],
              ),
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
            DateTimeCard(
              initialDateAndTime: widget.task.createdAt,
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
              onTap: () {
        
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: TranslationKeys.update.tr,
              color: AppColors.white,
              textColor: AppColors.primary,
              onTap: () {
                if (titleController.text != widget.task.title || descriptionController.text != widget.task.description || image != null) {
                UserCubit.get(context).updateTasks(id: widget.task.id!, title: titleController.text, description: descriptionController.text, image: image);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
