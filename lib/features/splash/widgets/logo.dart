import 'package:convo_sphere/core/constants/constant_files.dart';
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 92.w,
      height: 92.h,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: SweepGradient(
          colors: [
            AppColors.violet,
            AppColors.coral,
            AppColors.violet,
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.backgroundColor,
        ),
        child: Icon(
          Icons.headset_rounded,
          color: AppColors.primaryWhiteTextColor,
        
        ),
      ),
    );
  }
}