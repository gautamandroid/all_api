import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../api/services/auth_servies.dart';
import '../../../../api/show_app_message.dart';
import '../../../../sherd_prefrance/preference_key.dart';
import '../../../../sherd_prefrance/preference_manager.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
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

  // Future<void> userLogIn({String? emailId, String? password, required BuildContext context}) async {
  //   isLoading.value = true;
  //   final bodyData = {"username": emailId, "password": password};
  // //
  //   final response =  AuthServices.userLogin(bodyData);
  //   if (response != null) {
  //     await PreferencesManager.setString(PreferenceKey.accessToken, response.accessToken);
  //     isLoading.value = false;
  //     await PreferencesManager.storeLoginData(PreferenceKey.loginModel, response);
  //     ShowAppMessage.showMessage("User Login successfully!", true, snackBarType: SnackBarType.success);
  //     Get.offAllNamed(Routes.HOME);
  //   } else {
  //     isLoading.value = false;
  //     ShowAppMessage.showMessage("Something went wrong. Please try again.", true, snackBarType: SnackBarType.error);
  //   }
  // }

  void increment() => count.value++;
}
