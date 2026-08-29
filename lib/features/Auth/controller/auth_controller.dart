import 'package:convo_sphere/core/constants/constant_files.dart';
class AuthController extends GetxController{
  final RxBool isSecure = true.obs;
  void togglePassword() {
    isSecure.value = !isSecure.value;
  }
}