import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/onboarding/models/onboarding_model.dart';
class OnboardingController extends GetxController {
  var isStep2 = false.obs;
  final RxInt currentPage = 0.obs;
  final int totalPages = OnboardingModel.pages.length;
  bool get isLastPage =>currentPage.value == totalPages-1;
void nextPage() {
  if(!isLastPage) {
    currentPage.value++;
  } else {
    Get.offAllNamed(AppRoutes.home);
  }
}

void previousPage(){
  if(currentPage>0) {
    currentPage.value--;
  }
}

 void goToStepTwo() {
  isStep2.value =true;
 }

 @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 4),()  {
      goToStepTwo();
    });
  }
}