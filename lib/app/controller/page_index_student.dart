import 'package:get/get.dart';
import 'package:islamify/app/routes/app_pages.dart';

class PageIndexStudentController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int i) async {
    switch (i) {
      case 1:
        pageIndex.value = i;
        Get.offAllNamed(Routes.SCHEDULE_STUDENT);
        break;
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.PROFILE_STUDENT);
        break;
      default:
        pageIndex.value = i;
        Get.offAllNamed(Routes.HOME_STUDENT);
    }
  }
}
