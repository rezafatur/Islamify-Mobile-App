import 'package:get/get.dart';
import '../controllers/home_student_controller.dart';

class HomeStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStudentController>(
      () => HomeStudentController(),
    );
  }
}
