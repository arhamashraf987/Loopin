import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/gradient_button.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/core/shared_widgets/text_field.dart';

class AuthUsernameScreen extends StatelessWidget {
  const AuthUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
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
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
              child: Stack(
                children: [
                  Logo(
                    child: Icon(
                      Icons.add,
                      color: AppColors.primaryWhiteTextColor,
                    ),
                  ),
                  Positioned(
                    top: 64.h,
                    left: 60.w,
                    child: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhiteTextColor,
                        borderRadius: BorderRadius.circular(99.r),
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        color: AppColors.primaryBlackTextColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "First Name",
                  style: AppTextStyles.regular.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 10.h),
                buildTextField(),
                SizedBox(height: 27.h),
                 Text(
                  "Last Name",
                  style: AppTextStyles.regular.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 10.h),
                buildTextField(),
                SizedBox(height: 27.h),
                Text(
                  "Username",
                  style: AppTextStyles.regular.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 10.h),
                buildTextField(),
                SizedBox(height: 27.h),
              ],
            ),
            GradientButton(label: "Continue", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
