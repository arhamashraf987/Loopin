import 'dart:async';

import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/models/country_data.dart';
import 'package:convo_sphere/features/Auth/models/country_model.dart';

class AuthController extends GetxController {
  final RxBool isSecure = true.obs;
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
  void startResendTimer() {
    isResendEnabled.value =true;
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

  void togglePassword() {
    isSecure.value = !isSecure.value;
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

  void onSubmitCode(String value) {
    final fullCode = codeController.map((c) => c.text).join();
    if (fullCode.length == 6) {
      print("Full Code");
    } else {
      print("Write full code");
    }
  }

}
