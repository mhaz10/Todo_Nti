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

    final screenWidth = MediaQuery.of(context).size.width;

    double imageWidth = 334;
    double imageHeight = 433;

    if (screenWidth < 400) {
      imageWidth = screenWidth * 0.8;
      imageHeight = imageWidth * (433 / 334); // maintain aspect ratio
    }

    return Center(
      child: Image.asset(
        kSplashLogo,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
