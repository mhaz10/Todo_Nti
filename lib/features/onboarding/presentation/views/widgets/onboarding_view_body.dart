import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/core/constants/constants.dart';
import 'package:todo_app_nti/core/utils/styles.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(kOnBoardingLogo, width: 300, height: 330,),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Welcome To \n Do It !',
            textAlign: TextAlign.center,
            style: Styles.textStyle24,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            'Ready to conquer your tasks? Let\'s Do \n It together.',
            textAlign: TextAlign.center,
            style: Styles.textStyle16.copyWith(
              color: Color(0xFF6E6A7C)
            ),
          ),
        ),
        CustomButton(
          text: 'Let\'s Start', color: Color(kButtonColor),
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        },)
      ],
    );
  }
}



