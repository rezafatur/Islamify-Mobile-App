import 'package:get/get.dart';
import '../controllers/level_exam_controller.dart';

class LevelExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelExamController>(
      () => LevelExamController(),
    );
  }
}
