import 'package:get/get.dart';
import '../controllers/reward_controller.dart';

class RewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardController>(
      () => RewardController(),
    );
  }
}
