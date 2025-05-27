import 'package:get/get.dart';

class SpleshController extends GetxController {
  //TODO: Implement SpleshController

  final count = 0.obs;
  @override
  void onInit() {
    // Timer(const Duration(seconds: 3), () {
    //   redirectScreen();
    // });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // redirectScreen() async {
  //   loginData = await PreferencesManager.getLoginData(PreferenceKey.loginModel);
  //   if(loginData == null){
  //     Get.offAllNamed(Routes.LOGIN_SCREEN);
  //   } else{
  //     Get.offAllNamed(Routes.HOME);
  //   }
  // }
  //
  void increment() => count.value++;
}
