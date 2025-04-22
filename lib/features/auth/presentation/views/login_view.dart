import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:todo_app_nti/features/auth/presentation/views/widgets/login_view_body.dart';

import '../../../../core/constants/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(preferredSize: Size.fromHeight(300), child: Image.asset(
        kLoginImage,
        fit: BoxFit.fill,
      )),
      body: LoginViewBody(),
    );
  }
}