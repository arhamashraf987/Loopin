import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/onboarding/controller/onboarding_controller.dart';
class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}