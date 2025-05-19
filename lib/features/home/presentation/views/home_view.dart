import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/translation/translation_keys.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/core/utils/app_icons.dart';
import 'package:todo_app_nti/features/home/presentation/manger/user/user_cubit.dart';
import 'package:todo_app_nti/features/home/presentation/views/add_task_view.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:todo_app_nti/features/home/presentation/views/widgets/user_info.dart';
import 'package:todo_app_nti/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          AppResponsive.height(context, value: AppResponsive.height(context, value: 80)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: AppResponsive.height(context, value: 40),
            left: 16,
            right: 16,
          ),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return UserInfo();
              } else if (state is UserSuccessState) {
                return UserInfo(
                  isLoading: false,
                  onTap: () {
                    UserCubit.get(context).getUserData(user: state.userModel);
                    AppNavigator.goTo(screen: ProfileView());
                  },
                  userName: state.userModel.username,
                  userImage: state.userModel.imagePath,
                );
              }

              return UserInfo();
            },
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