import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/features/Auth/screens/phone_verify_screen.dart';
import 'package:convo_sphere/features/Auth/widgets/header_reusable.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
                  AppColors.bgRadius1.withOpacity(0.35),
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
                  AppColors.bgRadius2.withOpacity(0.2),
                  Colors.transparent,
                ],
                radius: 0.9,
                center: const Alignment(-0.3, 0.6),
              ),
            ),
          ),
          Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(height: 40.h, width: 40.w, iconSize: 14),
                  SizedBox(width: 10.w),
                  Text(
                    AppText.appName,
                    style: AppTextStyles.bold.copyWith(fontSize: 26.sp),
                  ),
                ],
              ),
        
              SizedBox(height: 50.h),
              Text(
                "Let's get you set up",
                style: AppTextStyles.bold.copyWith(fontSize: 32.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                "Choose how you'd like to continue",
                style: AppTextStyles.regular.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 40.h),
              GoogleLogin(),
              SizedBox(height: 20.h),
              authOptionContainer(
                "Continue with phone number",
                Icons.call_outlined,
                () {
                  Get.toNamed(AppRoutes.phoneVerify);
                },
              ),
              SizedBox(height: 20.h),
              authOptionContainer("Sign up with email", Icons.email_outlined, () {
                Get.toNamed(AppRoutes.signup);
              }),
              SizedBox(height: 20.h),
              Text(
                "By continuing you agree to our Terms & Privacy Policy.",
                style: AppTextStyles.regular.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 12.sp,
                ),
              ),
              Spacer(),
              alreadyAccount(),
              SizedBox(height: 50.h),
            ],
          ),
        ),
        ]
      ),
    );
  }

  Widget GoogleLogin() {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteTextColor,
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.google_icon, height: 40.h),
          SizedBox(width: 15.w),
          Text(
            "Continue with Google",
            style: AppTextStyles.medium.copyWith(
              color: AppColors.primaryBlackTextColor,
              fontSize: 22.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget authOptionContainer(
    String label,
    IconData iconName,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.violet, width: 2.w),
          borderRadius: BorderRadius.circular(99.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconName, color: AppColors.violet),
            SizedBox(width: 20.w),
            Text(label, style: AppTextStyles.bold.copyWith(fontSize: 22.sp)),
          ],
        ),
      ),
    );
  }

  Widget alreadyAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an accouunt?", style: AppTextStyles.regular),
        SizedBox(width: 6.w),
        GestureDetector(
          onTap: () {
            Get.offNamed(AppRoutes.login);
          },
          child: Text(
            "Login",
            style: AppTextStyles.regular.copyWith(color: AppColors.violet),
          ),
        ),
      ],
    );
  }
}
