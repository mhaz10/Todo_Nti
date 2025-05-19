import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';

import '../../../../../core/helper/app_navigator.dart';
import '../../../../../core/translation/translation_keys.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../profile/presentation/views/profile_view.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(
      {super.key, this.isLoading = true, this.userName, this.userImage, this.onTap});

  final void Function()? onTap;
  final bool isLoading;
  final String? userName;
  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return isLoading ?
    Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.grey.withAlpha(100),
        ),
        SizedBox(width: 14),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.grey.withAlpha(100),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                width: 100,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.grey.withAlpha(100),
                ),
              )
            ],
          ),
        ),
      ],
    ) : Row(children: [
      GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.white,
          backgroundImage: userImage == null ? AssetImage(AppAssets.user) : NetworkImage(userImage!),

        ),
      ),
      SizedBox(width: 14),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TranslationKeys.hello.tr,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            userName!,
            style: TextStyle(fontSize: 16, color: AppColors.grey),
          ),
        ],
      ),
    ],);
  }
}