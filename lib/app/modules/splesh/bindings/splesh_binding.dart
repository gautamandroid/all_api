import 'package:get/get.dart';

import '../controllers/splesh_controller.dart';

class SpleshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpleshController>(
      () => SpleshController(),
    );
  }
}
