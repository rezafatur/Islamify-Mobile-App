import 'package:get/get.dart';
import '../controllers/all_learning_controller.dart';

class AllLearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllLearningController>(
      () => AllLearningController(),
    );
  }
}
