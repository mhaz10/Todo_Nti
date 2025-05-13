import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';
import 'package:todo_app_nti/core/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_colors.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(300), child: Image.asset(
        AppAssets.user,
        fit: BoxFit.fill,
      )),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SingleChildScrollView(
          child: const Column(
            children: [
              CustomTextFormField(hintText: 'Old Password'),
              SizedBox(height: 10,),
              CustomTextFormField(hintText: 'New Password'),
              SizedBox(height: 10,),
              CustomTextFormField(hintText: 'Confirm Password'),
              SizedBox(height: 20,),
              CustomButton(text: 'Save', color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
