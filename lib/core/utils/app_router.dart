import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnboardingView(),
      ),

      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),

    ],
  );
}