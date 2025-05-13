import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';
import '../../../../../core/utils/app_assets.dart';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              width: 300,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(AppAssets.user),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomTaskField(
              hintText: 'Title',
              maxLines: 1,
              controller: titleController,
            ),
            const SizedBox(height: 20),
            CustomTaskField(
              hintText: 'Description',
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
              text: 'Add Task',
              color: AppColors.primary,
              isActive: isActive(),
              onTap: () {
                if (isActive()) {
                  // handle the task addition logic here
                }
              },
            ),
          ],
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
