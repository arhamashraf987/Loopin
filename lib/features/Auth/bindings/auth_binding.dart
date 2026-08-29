import 'package:convo_sphere/features/Auth/controller/auth_controller.dart';
import 'package:get/instance_manager.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(()=>AuthController());
  }
}