import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';

import 'custom_task_field.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

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
            CustomTaskField(hintText: 'Title',),
            const SizedBox(height: 20,),
            CustomTaskField(hintText: 'Description'),
            const SizedBox(height: 20,),
            CustomButton(text: 'Add Task', color: Color(0xFF149954))
          ],
        ),
      ),
    );
  }
}
