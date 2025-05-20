import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/core/utils/app_toast.dart';
import 'package:todo_app_nti/core/widgets/custom_button.dart';
import 'package:todo_app_nti/core/widgets/custom_text_form_field.dart';
import 'package:todo_app_nti/core/widgets/image_picker/image_manager_view.dart';
import 'package:todo_app_nti/features/profile/presentation/manger/user_profile/user_profile_cubit.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../home/presentation/manger/user/user_cubit.dart';
import '../../../data/repo/user_profile_implementation.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  XFile? image;
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit(UserProfileImplementation()),
      child: BlocListener<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          if (state is UserProfileSuccessState) {
            AppToast.showSuccessToast(state.message);
            UserCubit.get(context).getUserDataFromAPI();
            Navigator.pop(context);
          } else if (state is UserProfileFailureState) {
            AppToast.showErrorToast(state.error);
          }
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                AppResponsive.height(context, value: 350)),
            child: ImageManagerView(
              onPicked: (image) {
                this.image = image;
              },
              unPickedBody: Container(
                width: AppResponsive.width(context, value: 300),
                height: AppResponsive.width(context, value: 240),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.add, size: 50,),
              ),
            ),
          ),
          body: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(controller: usernameController, hintText: TranslationKeys.userName.tr),
                      CustomButton(
                        color: AppColors.primary,
                        text: TranslationKeys.update.tr,
                        onTap: () {
                          UserProfileCubit.get(context).updateUserProfile(name: usernameController.text, imagePath: image);

                      },),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
