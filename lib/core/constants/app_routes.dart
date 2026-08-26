import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Home/Screens/home_screen.dart';
import 'package:convo_sphere/features/onboarding/bindings/onboarding_binding.dart';
import 'package:convo_sphere/features/onboarding/screens/onboarding.dart';
import 'package:convo_sphere/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const home = '/home';
  

  static final pages = <GetPage>[
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(
      name: onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding()
    ),
    GetPage(name: home, page: ()=>HomeScreen())
  ];
}
