import 'package:gary_goodger/features/auth/controllers/onboarding_controller.dart';
import 'package:get/get.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
  Get.put(OnBoardingController());

  }

}



