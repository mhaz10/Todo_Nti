import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/core/utils/app_toast.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';
import 'package:todo_app_nti/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:todo_app_nti/features/auth/presentation/views/register_view.dart';
import '../../../../../core/helper/app_navigator.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../home/presentation/manger/user/user_cubit.dart';
import '../../../../home/presentation/views/home_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              CustomTextFormField(
                controller: usernameController,
                hintText: TranslationKeys.userName.tr,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: passwordController,
                hintText: TranslationKeys.userPassword.tr,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailureState) {
                    AppToast.showErrorToast(state.error);
                  } else if (state is LoginSuccessState) {
                    UserCubit.get(context).getUserData(user: state.userModel);
                    AppNavigator.goTo( screen: () => HomeView(), isReplace: true);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return CustomButton(
                      isLoading: true,
                      color: AppColors.primary,
                    );
                  }
                  return CustomButton(
                    text: TranslationKeys.login.tr,
                    color: AppColors.primary,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        LoginCubit.get(context).login(
                          username: usernameController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TranslationKeys.doNotHaveAnAccount.tr,
                    style: TextStyles.textStyle14.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      AppNavigator.goTo(screen: () => RegisterView());
                    },
                    child: Text(
                      TranslationKeys.register.tr,
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
