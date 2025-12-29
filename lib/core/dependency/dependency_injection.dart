import 'package:gary_goodger/features/on_boarding/controllers/onboarding_controller.dart';
import 'package:get/get.dart';


class DependencyInjection extends Bindings {
  @override
  void dependencies() {
  Get.put(OnBoardingController());}
}


// import '../../view/features/battle/controllers/battle_controller.dart';
//
// class DependencyInjection extends Bindings {
//   @override
//   void dependencies() {

//
//     Get.put(AuthController());
//
//     //auth================================
//     Get.lazyPut(() => SignUpController(), fenix: true);
//     Get.lazyPut(() => LogInController(), fenix: true);
//     Get.lazyPut(() => VerifyAccountOtpController(), fenix: true);
//     Get.lazyPut(() => ForgetPasswordController(), fenix: true);
//     Get.lazyPut(() => VerifyIdentityOtpController(), fenix: true);
//     Get.lazyPut(() => ResetPasswordController(), fenix: true);
//     Get.lazyPut(() => ResendOtpController(), fenix: true);
//     Get.lazyPut(() => UserResendOtpController(), fenix: true);
//     Get.lazyPut(() => ChangePasswordController(), fenix: true);
//
//     ///==========================Community section==================
//
//     //Get.lazyPut(() => AddPostController(), fenix: true);
//     Get.lazyPut(() => PostController(), fenix: true);
//     Get.lazyPut(() => CommunityController(), fenix: true);
//
//     ///profile section========================
//     Get.lazyPut(() => ProfileController(), fenix: true);
//
//     ///==========================Default Custom Controller ==================
//     Get.lazyPut(() => BattleController(), fenix: true);
//
//     Get.lazyPut(() => RewardsController(), fenix: true);
//     Get.lazyPut(() => HomeController(), fenix: true);
//
//     ///privacy terms faq
//
//     Get.lazyPut(() => AccountSettingController(), fenix: true);
//
//     ///reward controllers==========
//     Get.lazyPut(() => RewardsController(), fenix: true);
//   }
// }
