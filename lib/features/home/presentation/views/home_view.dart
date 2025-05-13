import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/home/presentation/views/add_task_view.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:todo_app_nti/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          AppResponsive.height(context, value: 70),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: AppResponsive.height(context, value: 40),
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  AppNavigator.goTo(screen: ProfileView());
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppAssets.user),
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
                    'User Name',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          AppNavigator.goTo(screen: AddTaskView());
        },
        child: SvgPicture.asset(AppIcons.addTaskIcon),
      ),
      body: HomeViewBody(),
    );
  }
}
