import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app_nti/core/widgets/image_picker/image_manager_view.dart';
import 'package:todo_app_nti/features/auth/presentation/views/widgets/register_view_body.dart';
import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/app_assets.dart';
import '../../data/repo/auth_repo_implemation.dart';
import '../manger/register/register_cubit.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(AuthRepoImplementation()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: ImageManagerView(
            onPicked: (image) {
              this.image = image;
            },
            unPickedBody: SizedBox(
              height: AppResponsive.height(context, value: 298),
              child: Image.asset(AppAssets.user),
            ),
          ),
        ),
        body: RegisterViewBody(image: image,),
      ),
    );
  }
}
