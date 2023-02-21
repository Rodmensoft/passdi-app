import 'package:get/get.dart';

import '../ui/pages/auth_page/auth_page.dart';
import '../ui/pages/bottomnavbar_page/bottomnavbar_page.dart';
import '../ui/pages/login_page/login_page.dart';
import '../ui/pages/onboarding_page/onboarding_page.dart';
import '../ui/pages/register_page/register_page.dart';
import '../ui/pages/requestpoints_page/requestpoints_page.dart';
import '../ui/pages/scoredetail_page/scoredetail_page.dart';
import '../ui/pages/splash_page/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.AUTH,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.BOTTOM,
      page: () => BottomNavbarPage(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: AppRoutes.SCOREDETAIL,
      page: () => const ScoreDetailPage(),
      binding: ScoreDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.REQUESTPOINTS,
      page: () => const RequestPointsPage(),
      binding: RequestPointsBinding(),
    ),
  ];
}
