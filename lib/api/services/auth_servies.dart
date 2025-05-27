import 'package:all_api/api/base_services.dart';
import 'package:all_api/api/base_url.dart';
import 'package:all_api/app/moduls/login_model.dart';

class AuthServices {

  static Future<LoginModel?> userLogin(var bodyData) async {
    try {
      ApiResponse response = await BaseServices().postData(ApiUrl.apiBaseUrl, bodyData);

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        return LoginModel.fromJson(response.data);
      }
    } catch (e) {
      print("error code${e}");
    }
    return null;
  }
}
