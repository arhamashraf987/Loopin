import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/screens/auth_screen.dart';
import 'package:convo_sphere/features/Auth/screens/login_screen.dart';
import 'package:convo_sphere/features/Auth/screens/phone_verify_screen.dart';
import 'package:convo_sphere/features/Auth/screens/signUp.dart';
import 'package:convo_sphere/features/Auth/bindings/auth_binding.dart';
import 'package:convo_sphere/features/onboarding/bindings/onboarding_binding.dart';
import 'package:convo_sphere/features/onboarding/screens/onboarding.dart';
import 'package:convo_sphere/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const signup = '/signup';
  static const login ='/login';
  static const authScreen ='/auth';
  static const phoneVerify = '/phone-verify';
  

  static final pages = <GetPage>[
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen(), binding: OnboardingBinding()),
    GetPage(name: signup, page: ()=>SignUp(), binding: AuthBinding()),
    GetPage(name: login, page: ()=> LoginScreen(), binding: AuthBinding()),
    GetPage(name: authScreen, page: ()=>AuthScreen(), binding: AuthBinding()),
    GetPage(name: phoneVerify, page: ()=>PhoneVerifyScreen(), binding: AuthBinding()),
    
  ];
}
