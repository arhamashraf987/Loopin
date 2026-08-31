import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/controller/auth_controller.dart';
class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
            final AuthController controller = Get.find<AuthController>();

    return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppColors.surfaceColor,
                      border: Border.all(
                        color: AppColors.borderStylingColor2.withOpacity(0.2)
                      )
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: 15.w, right: 20.w),
                      child: Obx(() {
                        final isSecure = controller.isSecure.value;
                        return Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: AppTextStyles.regular,
                                obscureText: isSecure,
                                decoration: InputDecoration(
                                   border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.togglePassword();
                              },
                              child: Icon(isSecure? Icons.visibility_outlined : Icons.visibility_off_outlined, 
                              color: AppColors.primaryWhiteTextColor, 
                              size: 24.sp,))
                          ],
                        );
                      }
                      ),
                    ),
                  );;
  }
}