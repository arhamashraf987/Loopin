import 'package:convo_sphere/core/constants/constant_files.dart';
class buildTextField extends StatelessWidget {
  final TextEditingController? textController;
  const buildTextField({super.key, this.textController});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppColors.surfaceColor,
                      border: Border.all(
                        color: AppColors.borderStylingColor2.withOpacity(0.2)
                      )
                    ),
                    child: TextField(
                      controller: textController,
                      style: AppTextStyles.regular,
                      decoration: InputDecoration(
                         border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding:  EdgeInsetsGeometry.only(left: 15.w),
                      ),
                    ),
                  );
  }
}