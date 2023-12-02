import 'package:get/get.dart';
import '../controllers/schedule_student_controller.dart';

class ScheduleStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleStudentController>(
      () => ScheduleStudentController(),
    );
  }
}
