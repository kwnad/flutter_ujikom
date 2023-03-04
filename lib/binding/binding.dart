import 'package:get/get.dart';
import 'package:ujikom/login/controller/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
