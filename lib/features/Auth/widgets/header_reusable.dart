import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/core/shared_widgets/reusable_border_styling.dart';
import 'package:convo_sphere/features/Auth/screens/signUp.dart';
class HeaderReusable extends StatelessWidget {
   HeaderReusable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         GestureDetector(
                    onTap: (){
                      Get.off(SignUp());
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
    );;
  }
}