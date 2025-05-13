import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/features/auth/presentation/views/login_view.dart';
import 'package:todo_app_nti/features/onboarding/presentation/views/onboarding_view.dart';
import '../../../../../core/cache/ cache_helper.dart';
import '../../../../../core/cache/cache_data.dart';
import '../../../../../core/cache/cache_keys.dart';

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
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);

      if (CacheData.firstTime != null) {
        // goto login
        AppNavigator.goTo(screen: () => LoginView(), isReplace: true);
      } else // first time
      {
        AppNavigator.goTo(screen: () => OnboardingView(), isReplace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.logo,
        width: AppResponsive.width(context, value: 334),
        height: AppResponsive.height(context, value: 433),
      ),
    );
  }
}
