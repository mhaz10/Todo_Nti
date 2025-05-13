import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/features/home/presentation/views/home_view.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

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
              CustomTextFormField(hintText: TranslationKeys.userName.tr),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: TranslationKeys.userPassword.tr,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: TranslationKeys.userConfirmPassword.tr,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: TranslationKeys.register.tr,
                color: AppColors.primary,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    AppNavigator.goTo(screen: HomeView());
                  }
                },
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TranslationKeys.alreadyHaveAnAccount.tr,
                    style: TextStyles.textStyle14.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      TranslationKeys.login.tr,
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
