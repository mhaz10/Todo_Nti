import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/features/auth/data/repo/auth_repo_implemation.dart';
import 'package:todo_app_nti/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:todo_app_nti/features/auth/presentation/views/widgets/login_view_body.dart';

import '../../../../core/widgets/image_picker/image_manager_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoImplementation()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: ImageManagerView(
            onPicked: (image) {},
            unPickedBody: SizedBox(
              height: AppResponsive.height(context, value: 298),
              child: Image.asset(AppAssets.user),
            ),
          ),
        ),
        body: LoginViewBody(),
      ),
    );
  }
}
