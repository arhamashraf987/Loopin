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
                    onTap: (){
                      Get.back();
                    },
                    child: ReusableBorderStyling(
                      height: 36.h,
                      width: 36.w,
                      borderRadius: 23.r,
                      backgroundColor:  AppColors.glassButtonBackgroundColor.withValues(alpha: 0.2),
                                    child: Icon(Icons.arrow_back, size: 24.sp, color: AppColors.primaryWhiteTextColor,)),
                  ),
                SizedBox(width: 105.w,),
                Logo(
                  height: 40.h,
                  width: 40.w,
                  iconSize: 14,
                ),
                SizedBox(width: 10.w,),
                Text(
                      AppText.appName,
                      style: AppTextStyles.bold.copyWith(fontSize: 26.sp),
                    ),
                ],
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
                child: Stack(children: [ Logo(child: Icon(Icons.add, color: AppColors.primaryWhiteTextColor,),
                ),
                Positioned(
                  top: 64.h,
                  left: 60.w,
                  child: Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteTextColor,
                      borderRadius: BorderRadius.circular(99.r)
                    ),
                    child: Icon(Icons.photo_camera, color: AppColors.primaryBlackTextColor, size: 20.sp,),
                  ),
                )
                          ],
                          ),
              ),
              SizedBox(height: 20.h,),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [
                     Text("Full Name", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),),
                  SizedBox(height: 10.h,),
                  buildTextField(),
                  SizedBox(height: 27.h,),
                  Text("Username", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),),
                  SizedBox(height: 10.h,),
                 buildTextField(),
                   SizedBox(height: 27.h,),
                  Text("Email", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),),
                  SizedBox(height: 10.h,),
                  buildTextField(),
                   SizedBox(height: 27.h,),
                  Text("Password", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),),
                  SizedBox(height: 10.h,),
                  PasswordField(),
                  SizedBox(height: 27.h,),
                  Center(child: Text("By signing up you agree to our Terms & Privacy Policy.", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary, fontSize: 13.sp,))),
                  SizedBox(height: 27.h,),
                  GradientButton(label: 'Sign Up', onTap: (){}),
                  Spacer(),
                  alreadyAccount(),
                  SizedBox(height: 30.h,),
                 
                  
                          ],
                          ),
              )
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
      Text("Already have an accouunt?", style: AppTextStyles.regular,),
      SizedBox(width: 6.w,),
      GestureDetector(
        onTap: (){
          Get.offNamed(AppRoutes.login);
        },
        child: Text("Login", style: AppTextStyles.regular.copyWith(color: AppColors.violet),))
    ],
  );
}
  
}