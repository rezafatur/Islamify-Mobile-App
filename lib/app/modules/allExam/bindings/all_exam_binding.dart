import 'package:get/get.dart';
import '../controllers/all_exam_controller.dart';

class AllExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllExamController>(
      () => AllExamController(),
    );
  }
}
