import 'package:get/get.dart';
import '../controllers/exam_controller.dart';

class ExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamController>(
      () => ExamController(),
    );
  }
}
