import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/constants/constants.dart';

import 'package:todo_app_nti/features/profile/presentation/views/widgets/custom_profile_button.dart';

import '../../../../../core/utils/app_router.dart';

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
            CustomProfileButton(icon: kProfileIcon, text: 'Profile', onTap: () {
              GoRouter.of(context).push(AppRouter.kUpdateProfile);
            },),
            SizedBox(height: 16,),
            CustomProfileButton(icon: kLockIcon, text: 'Change Password', onTap: () {
              GoRouter.of(context).push(AppRouter.kChangePassword);
            },),
            SizedBox(height: 16,),
            CustomProfileButton(icon: kSettingIcon, text: 'Settings', onTap: () {
              GoRouter.of(context).push(AppRouter.kSettings);
            },),
          ],
        ),
      ),
    );
  }
}

