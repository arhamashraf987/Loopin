import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/gradient_button.dart';
import 'package:convo_sphere/core/shared_widgets/reusable_border_styling.dart';
import 'package:convo_sphere/features/Auth/controller/auth_controller.dart';
import 'package:flutter/services.dart';

class PhoneCodeScreen extends StatelessWidget {
    final AuthController controller = Get.find<AuthController>();
   PhoneCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.phoneVerify);
                  },
                  child: ReusableBorderStyling(
                    height: 36.h,
                    width: 36.w,
                    backgroundColor: AppColors.glassButtonBackgroundColor
                        .withValues(alpha: 0.2),
                    child: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                      color: AppColors.primaryWhiteTextColor,
                    ),
                  ),
                ),
                SizedBox(width: 92.w),
                Text(
                  "Enter the code",
                  style: AppTextStyles.bold.copyWith(fontSize: 24.sp),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              " Sent to +92-3248908297",
              style: AppTextStyles.regular.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 40.h),
            _codeBox(controller),
            SizedBox(height: 20.h,),
            Obx(()=> controller.isResendEnabled.value? Text(" Send code again?", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),) : Text("Resend code in " + controller.formattedResendTime, style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),)),
            Spacer(),
            GradientButton(label: "verify", onTap: (){},),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _codeBox(AuthController controller) {
    double boxSpace = 8.h;
    double boxHeight = 60.h;
    double boxWidth = 45.h;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(6, (index) {
         return 
            Padding(
             padding:  EdgeInsets.symmetric(horizontal: boxSpace),
             child: Obx(() {
             final hasText = controller.hasDigit[index].value;
               return Container(
                  height: boxHeight,
                  width: boxWidth,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow:  [ hasText?
                      BoxShadow(
                        color: AppColors.violet.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 1

                      ) : BoxShadow(),
                    ],
                    border: Border.all(
                      color: hasText? AppColors.violet: AppColors.borderStylingColor2.withOpacity(0.2),
                    ),
                  ),
                  child: TextField(
                    controller: controller.codeController[index],
                    focusNode: controller.codeFocus[index],
                    style: AppTextStyles.regular.copyWith(fontSize: 30.sp),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 13.w),
                    ),
                    onChanged: (value) => controller.onChanged(index, value),
                  ),
                );
             }
             ),
         );
        }
        ),
      ],
    );
  }
}
