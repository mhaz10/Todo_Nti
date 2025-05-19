import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';
import 'package:todo_app_nti/core/widgets/custom_text_form_field.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';
import 'package:todo_app_nti/features/profile/data/repo/user_profile_repo.dart';
import 'package:todo_app_nti/features/profile/presentation/manger/change_password/change_password_cubit.dart';
import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/translation/translation_keys.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_toast.dart';
import '../../../../../core/widgets/image_picker/image_manager_view.dart';
import '../../../data/repo/user_profile_implementation.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(UserProfileImplementation()),
      child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            AppToast.showSuccessToast(state.message);
          } else if (state is ChangePasswordFailureState) {
            AppToast.showErrorToast(state.error);
          }
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              AppResponsive.height(context, value: 350),
            ),
            child: ImageManagerView(
              onPicked: (image) {},
              unPickedBody: SizedBox(
                height: AppResponsive.height(context, value: 300),
                child:
                    UserCubit.get(context).userModel?.imagePath != null
                        ? Image.network(
                          UserCubit.get(context).userModel!.imagePath!,
                        )
                        : Image.asset(AppAssets.user),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: TranslationKeys.oldPassword.tr,
                    isPassword: true,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: TranslationKeys.newPassword.tr,
                    isPassword: true,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: TranslationKeys.confirmPassword.tr,
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  Builder(
                    builder: (context) {
                      return CustomButton(
                        text: TranslationKeys.save.tr,
                        color: AppColors.primary,
                        onTap: () {
                          ChangePasswordCubit.get(context).changeUserPassword(
                            oldPassWord: oldPasswordController.text,
                            newPassWord: newPasswordController.text,
                            confirmPassWord: confirmPasswordController.text,
                          );
                        },
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
