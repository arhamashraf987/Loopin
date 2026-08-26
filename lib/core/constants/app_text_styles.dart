import 'package:convo_sphere/core/constants/constant_files.dart';
class AppTextStyles {
  static final extraLight = TextStyle(
    fontFamily: 'Clash Display',
    fontWeight: FontWeight.w200,
    fontSize: 16.h,
    color: AppColors.primaryWhiteTextColor,
  );

  static final light = TextStyle(
    fontFamily: 'Clash Display',
    fontWeight: FontWeight.w300,
    fontSize: 16.h,
    color: AppColors.primaryWhiteTextColor,
  );

  static final regular = TextStyle(
    fontFamily: 'Clash Display',
    fontWeight: FontWeight.w400,
    fontSize: 16.h,
    color: AppColors.primaryWhiteTextColor,
  );

  static final medium = TextStyle(
    fontFamily: 'Clash Display',
    fontWeight: FontWeight.w500,
    fontSize: 16.h,
    color: AppColors.primaryWhiteTextColor,
  );

  static final semiBold = TextStyle(
    fontFamily: 'Clash Display',
    fontWeight: FontWeight.w600,
    fontSize: 16.h,
    color: AppColors.primaryWhiteTextColor,
  );

  static final bold = TextStyle(
    fontFamily: 'Clash Display',
    fontWeight: FontWeight.w700,
    fontSize: 16.h,
    color: AppColors.primaryWhiteTextColor,
  );
}

extension TitleCaseExtension on String {
  String toTitleCase() {
    if (trim().isEmpty) return '';

    return toLowerCase()
        .split('\n')
        .map((line) {
          
          return line
              .split(' ')
              .map((word) {
                if (word.isEmpty) return word;
                return '${word[0].toUpperCase()}${word.substring(1)}';
              })
              .join(' '); 
        })
        .join('\n'); 
  }
}