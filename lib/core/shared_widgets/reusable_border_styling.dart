import 'dart:ui';

import 'package:convo_sphere/core/constants/constant_files.dart';
class ReusableBorderStyling extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final bool allBorderRadius;
  final double backgroundblur;
  final double horizontalPadding;
  final double verticalPadding;
  final Color? backgroundColor;
  final Gradient? gradient;
  final BoxBorder? border;
  final double? width;
  final double? height;
  const ReusableBorderStyling({
    super.key,
    required this.child,
    this.borderRadius,
    this.backgroundColor,
    this.backgroundblur = 20,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.gradient,
    this.border,
    this.width,
    this.height,
    this.allBorderRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: backgroundblur,
          sigmaY: backgroundblur,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color:
                backgroundColor ??
                AppColors.borderStylingColor1.withValues(alpha: .24),
            gradient: gradient,
            border:
                border ??
                Border.all(
                  color: AppColors.borderStylingColor2.withValues(alpha: 0.2),
                ),

            borderRadius: allBorderRadius
                ? BorderRadius.circular(borderRadius ?? 20.r)
                : BorderRadius.only(
                    topLeft: Radius.circular(borderRadius ?? 20.r),
                    bottomRight: Radius.circular(borderRadius ?? 20.r),
                  ),
          ),
          child: Material(type: MaterialType.transparency, child: child),
        ),
      ),
    );
  }
}