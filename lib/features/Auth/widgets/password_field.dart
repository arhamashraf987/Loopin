import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/controller/auth_controller.dart';
class PasswordField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;
  final bool isSecure;
  const PasswordField({super.key,  this.textEditingController, this.onTap, this.isSecure = false});

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
                    child:  Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: AppTextStyles.regular,
                              obscureText: isSecure,
                              decoration: InputDecoration(
                                 border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsetsGeometry.only(left: 15.w,),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: 20.w),
                            child: GestureDetector(
                              onTap: onTap,
                              child: Icon(isSecure? Icons.visibility_outlined : Icons.visibility_off_outlined, 
                              color: AppColors.primaryWhiteTextColor, 
                              size: 24.sp,)),
                          )
                        ],
                    )
                      );
                    }
                    
                 
  }