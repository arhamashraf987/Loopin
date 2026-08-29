import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/onboarding/models/onboarding_model.dart';

class OnboardingController extends GetxController {
  var isStep2 = false.obs;
  final RxInt currentPage = 0.obs;
  final int totalPages = OnboardingModel.pages.length;
  bool get isLastPage => currentPage.value == totalPages - 1;

  late final AnimationController animationController;

  late final Animation<double> logoShift;
  late final Animation<double> subtitleFade;
  late final Animation<Offset> subtitleSlide;
  late final Animation<double> dotsFade;
  late final Animation<double> dotsScale;
  late final Animation<double> buttonFade;
  late final Animation<Offset> buttonSlide;

  void initAnimations(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 900),
    );

    logoShift = CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
    );

    subtitleFade = CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.15, 0.6, curve: Curves.easeOut),
    );
    subtitleSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.15, 0.6, curve: Curves.easeOutCubic),
    ));

    dotsFade = CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.35, 0.75, curve: Curves.easeOut),
    );
    dotsScale = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.35, 0.75, curve: Curves.easeOutBack),
      ),
    );

    buttonFade = CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    );
    buttonSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
    ));

    ever(isStep2, (bool value) {
      if (value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });

    if (isStep2.value) {
      animationController.value = 1.0;
    }
  }

  void nextPage() {
    if (!isLastPage) {
      currentPage.value++;
    } else {
      Get.offAllNamed(AppRoutes.signup);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void goToStepTwo() {
    isStep2.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 4), () {
      goToStepTwo();
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}