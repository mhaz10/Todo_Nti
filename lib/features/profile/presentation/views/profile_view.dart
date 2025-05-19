import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/profile_view_body.dart';

import '../../../home/presentation/manger/user/user_cubit.dart';
import '../../../home/presentation/views/widgets/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          AppResponsive.height(context, value: 80),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.0492,
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
                  userName: state.userModel.username,
                  userImage: state.userModel.imagePath,
                );
              }

              return UserInfo();
            },
          ),
        ),
      ),
      body: ProfileViewBody(),
    );
  }
}
