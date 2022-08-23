import 'package:get/get.dart';
import 'package:graphe_firebase_notification/controllers/auth_controller.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    // Get.put<CheckInternetController>(CheckInternetController());
  }
}
