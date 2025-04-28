import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView);
    });
}

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Image.asset(
        kSplashLogo,
        width: MediaQuery.of(context).size.width * 0.8906,
        height: MediaQuery.of(context).size.height * 0.5332,
      ),
    );
  }
}
