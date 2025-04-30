import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';

import 'custom_drop_down.dart';
import 'custom_task_field.dart';
import 'data_time_card.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {

  String? title;
  String? description;
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
            const SizedBox(height: 40,),
            Container(
              width: 300,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(kLoginImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            CustomTaskField(
              hintText: 'Title',
              maxLines: 1,
              onSubmitted: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            const SizedBox(height: 20,),
            CustomTaskField(
              hintText: 'Description',
              onSubmitted: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
            const SizedBox(height: 20,),
            CustomDropdown(
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
            },),
            const SizedBox(height: 20,),
            DateTimeCard(
              onDateTimeSelected: (date, time) {
                setState(() {
                  selectedDate = date;
                  selectedTime = time;
                });
              },
            ),
            const SizedBox(height: 20,),
            CustomButton(
              text: 'Add Task',
              color: Color(0xFF149954),
              isActive: isActive(),
              onTap: () {
                if(isActive()) {
                  print('Title: $title');
                  print('Description: $description');
                  print('Group: $groupValue');
                  print('Date: $selectedDate');
                  print('Time: $selectedTime');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  bool isActive () {
    if (title != null && description != null && groupValue != null && selectedDate != null && selectedTime != null) {
      return true;
    }

    return false;
  }
}

