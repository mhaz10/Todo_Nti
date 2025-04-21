import 'package:flutter/material.dart';
import 'package:todo_app_nti/core/constants/constants.dart';

import '../../../../../core/widgets/custom_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(kOnBoardingLogo),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Welcome To \n Do It !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Ready to conquer your tasks? Let\'s Do \n It together.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6E6A7C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomButton(text: 'Let\'s Start', color: Color(0xFF149954),)
      ],
    );
  }
}



