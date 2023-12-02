import 'package:get/get.dart';
import '../controllers/profile_student_controller.dart';

class ProfileStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileStudentController>(
      () => ProfileStudentController(),
    );
  }
}
