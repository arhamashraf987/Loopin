
import 'package:convo_sphere/core/constants/constant_files.dart';
class Logo extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final double? iconSize;
  const Logo({super.key, 
   this.child,
   this.height,
   this.width,
   this.iconSize});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width?? 92.w,
      height: height?? 92.h,
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
        child: child ?? Icon(
          Icons.headset_rounded,
          color: AppColors.primaryWhiteTextColor,
          size: iconSize?? null,
        
        ),
      ),
    );
  }
}