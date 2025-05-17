import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_nti/core/widgets/image_picker/image_manager_view.dart';
import 'package:todo_app_nti/features/auth/presentation/views/widgets/register_view_body.dart';

import '../../../../core/utils/app_assets.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: ImageManagerView(
          onPicked: (image) {},
          unPickedBody: SvgPicture.asset(
              AppAssets.user,
          ),
        ),
      ),
      body: RegisterViewBody(),
    );
  }
}
