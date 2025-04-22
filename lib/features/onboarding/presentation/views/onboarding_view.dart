import 'package:flutter/material.dart';
import 'package:todo_app_nti/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OnboardingViewBody(),
    );
  }
}
