import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/helper/app_navigator.dart';
import 'package:todo_app_nti/core/helper/app_responsive.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/features/auth/presentation/views/login_view.dart';
import 'package:todo_app_nti/features/home/presentation/views/home_view.dart';
import 'package:todo_app_nti/features/onboarding/presentation/views/onboarding_view.dart';
import '../../../../../core/cache/ cache_helper.dart';
import '../../../../../core/cache/cache_data.dart';
import '../../../../../core/cache/cache_keys.dart';
import '../../../../home/presentation/manger/user/user_cubit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    navigateToNextScreen(context);
    super.initState();
  }


  void navigateToNextScreen(context) async {
    await Future.delayed((Duration(milliseconds: 500)), () {
      // navigate to lets start view
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null) {
        // check is logged in
        CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
        if (CacheData.accessToken != null) {
          UserCubit.get(context).getUserDataFromAPI().then((bool result) {
            if (result) {
              AppNavigator.goTo(screen: () => HomeView(), isReplace: true);
            } else {
              AppNavigator.goTo(screen: () => LoginView(), isReplace: true);
            }
          });
        } else {
          // goto login
          AppNavigator.goTo(screen: () => LoginView(), isReplace: true);
        }
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
