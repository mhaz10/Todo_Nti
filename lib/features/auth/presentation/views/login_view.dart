import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/auth/presentation/views/widgets/login_view_body.dart';

import '../../../../core/widgets/image_picker/image_manager_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: ImageManagerView(onPicked: (image) {}),
      ),
      body: LoginViewBody(),
    );
  }
}
