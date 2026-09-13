import 'package:convo_sphere/features/Home/controller/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
  }
}