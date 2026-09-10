import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/gradient_button.dart';
import 'package:convo_sphere/core/shared_widgets/reusable_border_styling.dart';
import 'package:convo_sphere/core/shared_widgets/text_field.dart';
import 'package:convo_sphere/features/Auth/controller/auth_controller.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/features/Auth/widgets/password_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: ReusableBorderStyling(
                      height: 36.h,
                      width: 36.w,
                      borderRadius: 23.r,
                      backgroundColor: AppColors.glassButtonBackgroundColor
                          .withValues(alpha: 0.2),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.sp,
                        color: AppColors.primaryWhiteTextColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 105.w),
                  Logo(height: 40.h, width: 40.w, iconSize: 14),
                  Text(
                    AppText.appName,
                    style: AppTextStyles.bold.copyWith(fontSize: 26.sp),
                  ),
                ],
              ),
              SizedBox(height: 100.h),
              Text(
                "Create your Account",
                style: TextStyle(
                  color: AppColors.primaryWhiteTextColor,
                  fontSize: 36.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight(600),
                ),
              ),
              SizedBox(height: 60.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: AppTextStyles.regular.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    buildTextField(),
                    SizedBox(height: 27.h),
                    Text(
                      "Password",
                      style: AppTextStyles.regular.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                 Obx(()=>  PasswordField(textEditingController: controller.signupPass1, onTap: (){controller.togglePassword1();}, isSecure: controller.isSecure1.value,)),
                    SizedBox(height: 27.h),
                      Row(
                        children: [
                          Text( 
                            "Confirm Password",
                            style: AppTextStyles.regular.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 10.h),
                  
                      Obx(()=>
                        PasswordField(textEditingController: controller.signupPass2,
                        isSecure: controller.isSecure2.value,
                        onTap: () {
                          controller.togglePassword2();
                        },),
                        
                      ),
                      
                    
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        "By signing up you agree to our Terms & Privacy Policy.",
                        style: AppTextStyles.regular.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    GradientButton(label: 'Sign Up', onTap: () {
                      controller.signUp();
                    }),
                    SizedBox(height: 15.h),
                    alreadyAccount(),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ],
          ),
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
