import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/features/onboarding/screens/onboarding.dart';
import 'package:convo_sphere/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';


void main() {
  runApp(
     DevicePreview(
    enabled: true,
      builder: (context) => const MyApp(
        
      ),
    
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true, 
      builder: (context, child) {
        return GetMaterialApp(
         
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          getPages: AppRoutes.pages,
          initialRoute: AppRoutes.authScreen,
        );
      },
    );
  }
}