import 'package:get/get.dart';
import 'package:islamify/app/modules/allSurah/controllers/all_surah_controller.dart';

class AllSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllSurahController>(
      () => AllSurahController(),
    );
  }
}
