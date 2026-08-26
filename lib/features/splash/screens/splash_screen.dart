import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/splash/widgets/logo.dart';
class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
           Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.bgRadius2.withOpacity(0.35),
                    Colors.transparent,
                  ],
                  radius: 0.9,
                  center: const Alignment(0.4, -0.3),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.bgRadius1.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  radius: 0.7,
                  center: const Alignment(-0.3, 0.6),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(),
                  SizedBox(height: 24.h),
              Text(
                'Loopin',
                style: AppTextStyles.bold.copyWith(fontSize: 26.sp),
              ),
                ],
              ),
            )
        ],
      ),
    );
  }
}