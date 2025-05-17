import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_nti/core/utils/app_assets.dart';
import 'package:todo_app_nti/core/utils/app_colors.dart';
import 'package:todo_app_nti/features/auth/presentation/views/login_view.dart';
import '../../../../../core/cache/ cache_helper.dart';
import '../../../../../core/cache/cache_keys.dart';
import '../../../../../core/helper/app_navigator.dart';
import '../../../../../core/translation/translation_keys.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';


class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.getStart, width: 300, height: 330,),
        const SizedBox(height: 20),
        Center(
          child: Text(
            TranslationKeys.welcomeToDoIt.tr,
            textAlign: TextAlign.center,
            style: TextStyles.textStyle24,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            TranslationKeys.readyToConquer.tr,
            textAlign: TextAlign.center,
            style: TextStyles.textStyle16.copyWith(
              color: AppColors.grey
            ),
          ),
        ),
        CustomButton(
          text: TranslationKeys.letStart.tr, color: AppColors.primary,
          onTap: () async {
            await CacheHelper.saveData(key: CacheKeys.firstTime, value: false);
            AppNavigator.goTo(screen: ()=> LoginView());
        },)
      ],
    );
  }
}



