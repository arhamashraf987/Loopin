import 'package:convo_sphere/core/constants/constant_files.dart';

class GradientButton extends StatelessWidget {
   GradientButton({required this.label, required this.onTap});


  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999.r),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 52.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.violet, AppColors.coral],
              ),
              borderRadius: BorderRadius.circular(999.r),
            ),
            child: Center(
              child: Text(
                label,
                style: AppTextStyles.semiBold.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}