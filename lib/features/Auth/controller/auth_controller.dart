import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/models/country_data.dart';
import 'package:convo_sphere/features/Auth/models/country_model.dart';
class AuthController extends GetxController{
  final RxBool isSecure = true.obs;
  final Rx<Country>  selectedCountry = CountryData.countries.first.obs;
  final TextEditingController countryQuery = TextEditingController();
  final RxList<Country> filteredCountries = <Country>[].obs;
  @override
  void onInit() {
    super.onInit();
    filteredCountries.assignAll(CountryData.countries);
    countryQuery.addListener(_filterCountries);
  }
  @override
  void onClose() {
    countryQuery.removeListener(_filterCountries);
    countryQuery.dispose();
    super.onClose();

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

}