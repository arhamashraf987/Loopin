import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/gradient_button.dart';
import 'package:convo_sphere/features/onboarding/controller/onboarding_controller.dart';
import 'package:convo_sphere/features/onboarding/models/onboarding_model.dart';
import 'package:convo_sphere/features/onboarding/widgets/onboarding_dots.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final OnboardingController controller = Get.find<OnboardingController>();

  @override
  void initState() {
    super.initState();
    controller.initAnimations(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.bgRadius2.withOpacity(0.35),
                  Colors.transparent,
                ],
                radius: 0.9,
                center: const Alignment(0.4, -0.3),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.bgRadius1.withOpacity(0.6),
                  Colors.transparent,
                ],
                radius: 0.7,
                center: const Alignment(-0.3, 0.6),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    padding: EdgeInsets.only(
                      bottom: controller.logoShift.value,
                    ),
                    child: const Center(child: Logo()),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppText.appName,
                    style: AppTextStyles.bold.copyWith(fontSize: 26.sp),
                  ),
                  SizedBox(height: 10.h),
                  ClipRect(
                    child: Align(
                      heightFactor: controller.subtitleFade.value,
                      child: FadeTransition(
                        opacity: controller.subtitleFade,
                        child: SlideTransition(
                          position: controller.subtitleSlide,
                          child: GestureDetector(
                            onHorizontalDragEnd: (details) {
                              if (details.primaryVelocity! < 0) {
                                controller.nextPage();
                              } else if (details.primaryVelocity! > 0) {
                                controller.previousPage();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Obx(
                                () => AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: Text(
                                    OnboardingModel
                                        .pages[controller.currentPage.value],
                                    key: ValueKey(controller.currentPage.value),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.regular.copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.mutedTextColor,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h * controller.dotsFade.value),
                  FadeTransition(
                    opacity: controller.dotsFade,
                    child: ScaleTransition(
                      scale: controller.dotsScale,
                      child: OnboardingDots(count: 3),
                    ),
                  ),
                  SizedBox(height: 28.h * controller.buttonFade.value),
                  ClipRect(
                    child: Align(
                      heightFactor: controller.buttonFade.value,
                      child: FadeTransition(
                        opacity: controller.buttonFade,
                        child: SlideTransition(
                          position: controller.buttonSlide,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Obx(() {
                              return GradientButton(
                                label: controller.isLastPage
                                    ? 'Get started'
                                    : 'Continue',
                                onTap: () {
                                  controller.nextPage();
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h * controller.buttonFade.value),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}