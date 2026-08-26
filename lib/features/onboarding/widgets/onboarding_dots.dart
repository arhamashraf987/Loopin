import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/onboarding/controller/onboarding_controller.dart';
class OnboardingDots extends StatelessWidget {
   OnboardingDots({ required this.count});

  final OnboardingController controller = Get.find<OnboardingController>();
  final int count;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final activeIndex =controller.currentPage.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          final bool isActive = index == activeIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            width: isActive ? 18.w : 6.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.violet
                  : AppColors.primaryWhiteTextColor.withOpacity(0.18),
              borderRadius: BorderRadius.circular(4.r),
            ),
          );
        }),
      );
    }
    );
  }
}