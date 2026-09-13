import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/screens/auth_screen.dart';
import 'package:convo_sphere/features/Auth/screens/auth_username_screen.dart';
import 'package:convo_sphere/features/Auth/screens/login_screen.dart';
import 'package:convo_sphere/features/Auth/screens/phone_code_screen.dart';
import 'package:convo_sphere/features/Auth/screens/phone_verify_screen.dart';
import 'package:convo_sphere/features/Auth/screens/signUp.dart';
import 'package:convo_sphere/features/Auth/bindings/auth_binding.dart';
import 'package:convo_sphere/features/Home/Screens/add_friend_screen.dart';
import 'package:convo_sphere/features/Home/Screens/group_call_screen.dart';
import 'package:convo_sphere/features/Home/Screens/home_screen.dart';
import 'package:convo_sphere/features/Home/bindings/home_binding.dart';
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
  static const phoneVerify = '/phone_verify';
  static const phoneCode = '/phone_code';
  static const AuthUsername = '/auth_user_name';
  static const homeScreen = '/home_screen';
  static const addFriendScreen = '/add_friend_screen';
  static const groupcallScreen = '/group_call_screen';
  

  static final pages = <GetPage>[
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen(), binding: OnboardingBinding()),
    GetPage(name: signup, page: ()=>SignUp(), binding: AuthBinding()),
    GetPage(name: login, page: ()=> LoginScreen(), binding: AuthBinding()),
    GetPage(name: authScreen, page: ()=>AuthScreen(), binding: AuthBinding()),
    GetPage(name: phoneVerify, page: ()=>PhoneVerifyScreen(), binding: AuthBinding()),
    GetPage(name: phoneCode, page: ()=>PhoneCodeScreen(), binding: AuthBinding()),
    GetPage(name: AuthUsername, page: ()=>AuthUsernameScreen(), binding: AuthBinding()),
    GetPage(name: homeScreen, page: ()=>HomeScreen(), binding: HomeBinding()),
    GetPage(name: addFriendScreen, page: ()=>AddFriendScreen(), binding: HomeBinding()),
    GetPage(name: groupcallScreen, page: ()=>GroupCallScreen(), binding: HomeBinding())
    
  ];
}
