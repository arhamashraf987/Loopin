import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/onboarding/controller/onboarding_controller.dart';
import 'package:convo_sphere/features/onboarding/models/onboarding_model.dart';
import 'package:convo_sphere/features/onboarding/widgets/gradient_button.dart';
import 'package:convo_sphere/features/onboarding/widgets/onboarding_dots.dart';
import 'package:convo_sphere/features/splash/widgets/logo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final OnboardingController controller = Get.find<OnboardingController>();

  late final AnimationController _controller;

  late final Animation<double> _logoShift;
  late final Animation<double> _subtitleFade;
  late final Animation<Offset> _subtitleSlide;
  late final Animation<double> _dotsFade;
  late final Animation<double> _dotsScale;
  late final Animation<double> _buttonFade;
  late final Animation<Offset> _buttonSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _logoShift = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
    );

    _subtitleFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.15, 0.6, curve: Curves.easeOut),
    );
    _subtitleSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.15, 0.6, curve: Curves.easeOutCubic),
    ));

    _dotsFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 0.75, curve: Curves.easeOut),
    );
    _dotsScale = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.75, curve: Curves.easeOutBack),
      ),
    );

    _buttonFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );
    _buttonSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
    ));

    ever(controller.isStep2, (bool isStep2) {
      if (isStep2) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    if (controller.isStep2.value) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            animation: _controller,
            builder: (context, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    padding: EdgeInsets.only(
                      bottom:  _logoShift.value,
                    ),
                    child: const Center(child: Logo()),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Loopin',
                    style: AppTextStyles.bold.copyWith(fontSize: 26.sp),
                  ),
                  SizedBox(height: 10.h),
                  ClipRect(
                    child: Align(
                      heightFactor: _subtitleFade.value,
                      child: FadeTransition(
                        opacity: _subtitleFade,
                        child: SlideTransition(
                          position: _subtitleSlide,
                          child: GestureDetector(
                            onHorizontalDragEnd: (details) {
                              if(details.primaryVelocity!<0){
                                controller.nextPage();
                              } else if(details.primaryVelocity!>0) {
                                controller.previousPage();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Obx(() =>
                                AnimatedSwitcher(
                                  duration: Duration(milliseconds: 200),
                                  child: Text(
                                   OnboardingModel.pages[controller.currentPage.value],
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
                  SizedBox(height: 40.h * _dotsFade.value),
                  FadeTransition(
                    opacity: _dotsFade,
                    child: ScaleTransition(
                      scale: _dotsScale,
                      child:  OnboardingDots(count: 3),
                    ),
                  ),
                  SizedBox(height: 28.h * _buttonFade.value),
                  ClipRect(
                    child: Align(
                      heightFactor: _buttonFade.value,
                      child: FadeTransition(
                        opacity: _buttonFade,
                        child: SlideTransition(
                          position: _buttonSlide,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                          
                            child:Obx(() {
                              return GradientButton(
                                label: controller.isLastPage? 'Get started': 'Continue',
                                onTap: () {
                                  controller.nextPage();
                                },
                              );
                            }
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h * _buttonFade.value),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
  
}



