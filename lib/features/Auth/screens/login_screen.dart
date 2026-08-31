import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/gradient_button.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/core/shared_widgets/reusable_border_styling.dart';
import 'package:convo_sphere/core/shared_widgets/text_field.dart';
import 'package:convo_sphere/features/Auth/controller/auth_controller.dart';
import 'package:convo_sphere/features/Auth/screens/signUp.dart';
import 'package:convo_sphere/features/Auth/widgets/header_reusable.dart';
import 'package:convo_sphere/features/Auth/widgets/password_field.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final AuthController controller = Get.find<AuthController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: 
      Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
        child: Column(
          children: [
            HeaderReusable(),
              SizedBox(height: 100.h,),
            Text("Welcome Back!", style: TextStyle(
              color: AppColors.primaryWhiteTextColor,
              fontSize: 42.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight(600)
            )),
            SizedBox(height: 60.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Email", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),),
                  SizedBox(height: 10.h,),
                  buildTextField(),
                   SizedBox(height: 27.h,),
                  Text("Password", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),),
                  SizedBox(height: 10.h,),
                  PasswordField(),
                  SizedBox(height: 40.h,),
                  GradientButton(label: "Login", onTap: (){})
              ],
            ),
                   

          ],
        ),
      ),
    );
  }
}