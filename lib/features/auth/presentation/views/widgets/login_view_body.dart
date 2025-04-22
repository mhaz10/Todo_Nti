import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/utils/app_router.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';

import 'custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(hintText: 'User Name',),
            const SizedBox(height: 20,),
            CustomTextFormField(hintText: 'Password', isPassword: true,),
            const SizedBox(height: 16,),
            CustomButton(text: 'Login', color: Color(0xFF149954),
              onTap: () {
        
              },),
            const SizedBox(height: 14,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Don’t Have An Account?'),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kRegisterView);
                },
                child: const Text('Register', style: TextStyle(
                  color: Colors.black
                ),),
              )
            ],)
          ],
        ),
      ),
    );
  }
}

