import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'custom_text_form_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(hintText: 'User Name'),
              const SizedBox(height: 20,),
              CustomTextFormField(hintText: 'Password', isPassword: true,),
              const SizedBox(height: 20,),
              CustomTextFormField(hintText: 'Confirm Password', isPassword: true,),
              const SizedBox(height: 16,),
              CustomButton(
                text: 'Register',
                color: Color(0xFF149954),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  }
                },),
              const SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have An Account?'),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('Login', style: TextStyle(
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
