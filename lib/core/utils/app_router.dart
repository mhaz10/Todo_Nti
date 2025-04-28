import 'package:go_router/go_router.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/change_password.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/settings.dart';
import 'package:todo_app_nti/features/profile/presentation/views/widgets/update_profile.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/home/presentation/views/add_task_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kHomeView = '/HomeView';
  static const kAddTaskView = '/AddTaskView';
  static const kProfileView = '/ProfileView';
  static const kUpdateProfile = '/UpdateProfile';
  static const kChangePassword = '/ChangePassword';
  static const kSettings = '/Settings';

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

      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),

      GoRoute(
        path: kAddTaskView,
        builder: (context, state) => const AddTaskView(),
      ),

      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),

      GoRoute(
        path: kUpdateProfile,
        builder: (context, state) => const UpdateProfile(),
      ),

      GoRoute(
        path: kChangePassword,
        builder: (context, state) => const ChangePassword(),
      ),

      GoRoute(
        path: kSettings,
        builder: (context, state) => const Settings(),
      ),

    ],
  );
}