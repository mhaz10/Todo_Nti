import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: SplashViewBody());
  }
}
