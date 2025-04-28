import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/utils/app_router.dart';
import 'package:todo_app_nti/core/utils/styles.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(hintText: 'User Name'),
              const SizedBox(height: 20,),
              CustomTextFormField(hintText: 'Password', isPassword: true,),
              const SizedBox(height: 16,),
              CustomButton(text: 'Login', color: Color(0xFF149954),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  }
                },),
              const SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Don’t Have An Account?', style: Styles.textStyle14.copyWith(
                  color: const Color(0xFF6E6A7C)
                ),),
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
      ),
    );
  }
}
