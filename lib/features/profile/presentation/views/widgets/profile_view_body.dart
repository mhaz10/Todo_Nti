import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/change_password.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/custom_profile_button.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/settings.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/update_profile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CustomProfileButton(
              icon: AppIcons.profileIcon,
              text: TranslationKeys.profile.tr,
              onTap: () {
                AppNavigator.goTo(screen: UpdateProfile());
              },
            ),
            SizedBox(height: 16),
            CustomProfileButton(
              icon: AppIcons.lockIcon,
              text: TranslationKeys.changePassword.tr,
              onTap: () {
                AppNavigator.goTo(screen: ChangePassword());
              },
            ),
            SizedBox(height: 16),
            CustomProfileButton(
              icon: AppIcons.settingIcon,
              text: TranslationKeys.settings.tr,
              onTap: () {
                AppNavigator.goTo(screen: Settings());
              },
            ),
          ],
        ),
      ),
    );
  }
}
