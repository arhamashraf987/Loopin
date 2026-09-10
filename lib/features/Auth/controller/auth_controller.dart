import 'dart:async';

import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/models/country_data.dart';
import 'package:convo_sphere/features/Auth/models/country_model.dart';

class AuthController extends GetxController {
  final TextEditingController signupPass1 = TextEditingController();
  final TextEditingController signupPass2 = TextEditingController();
  final RxBool isSecure1 = true.obs;
  final RxBool isSecure2 = true.obs;
  final RxBool phoneFieldError = false.obs;
  final Rx<Country> selectedCountry = CountryData.countries.first.obs;
  final TextEditingController countryQuery = TextEditingController();
  final RxList<Country> filteredCountries = <Country>[].obs;
  final TextEditingController numberController = TextEditingController();
  final Rx<String> phoneNumber = "".obs;
  final List<TextEditingController> codeController = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> codeFocus = List.generate(6, (_) => FocusNode());
  final List<RxBool> hasDigit = List.generate(6, (_) => false.obs);
  final RxInt resendTimer =0.obs;
  final RxBool isResendEnabled = true.obs;
  String get fullPhoneNumber => "${selectedCountry.value.dialCode}${phoneNumber.value}";
  Timer? _resendTimer;

  @override
  void onInit() {
    super.onInit();
    filteredCountries.assignAll(CountryData.countries);
    countryQuery.addListener(_filterCountries);
    startResendTimer();
  }

  @override
  void onClose() {
    countryQuery.removeListener(_filterCountries);
    countryQuery.dispose();
    for (var controller in codeController) {
      controller.dispose();
    }
    for (var focus in codeFocus) {
      focus.dispose();
    }
    _resendTimer?.cancel();
    super.onClose();
  }

void sendCode() {
  phoneNumber.value = numberController.text;
  if(numberController.text.isEmpty) {
    phoneFieldError.value=true;
      Get.snackbar(
        colorText: Colors.white,
        "Error!", "Phone numeber field is empty" ); 
      } else {
        phoneFieldError.value=false;
        Get.toNamed(AppRoutes.phoneCode);
      }
  
}
  void startResendTimer() {
    isResendEnabled.value =false;
    resendTimer.value =120;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), ((timer) {
      if(resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        isResendEnabled.value = true;
        timer.cancel();
      }
    }
    ));
  }
  String get formattedResendTime {
    final minutes = resendTimer.value ~/ 60;
    final seconds = resendTimer.value % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  void togglePassword1() {
    isSecure1.value = !isSecure1.value;
  }
  void togglePassword2() {
    isSecure2.value = !isSecure2.value;
  }
  void selectCountry(Country country) {
    selectedCountry.value = country;
  }

  void _filterCountries() {
    final query = countryQuery.text.toLowerCase();
    if (query.isEmpty) {
      filteredCountries.assignAll(CountryData.countries);
    } else {
      final filtered = CountryData.countries.where((country) {
        return country.name.toLowerCase().contains(query);
      }).toList();
      filteredCountries.assignAll(filtered);
    }
  }

  void onChanged(int index, String value) {
    hasDigit[index].value = value.isNotEmpty;
    if (value.length == 1) {
      if (index < 5) {
        codeFocus[index + 1].requestFocus();
      } else {
        FocusScope.of(Get.context!).unfocus();
      }
    } else if 
    (value.isEmpty && index > 0) {
      codeFocus[index - 1].requestFocus();
    }
  }

  void onSubmitCode() {
    final fullCode = codeController.map((c) => c.text).join();
    if (fullCode.length == 6) {
      print("Full Code");
    } else {
      phoneFieldError.value=true;
      Get.snackbar(
        colorText: Colors.white,
        "Error!", "Code field is Empty" );
    }
  }

  void sendCodeAagain() {
    startResendTimer();
  }
  void signUp(){
    if(signupPass1?.text == signupPass2?.text) {
      Get.toNamed(AppRoutes.AuthUsername);
    } else {
       Get.snackbar(
        colorText: Colors.white,
        "Error!", "Password Not match" );
    
    }
  }
  

}
