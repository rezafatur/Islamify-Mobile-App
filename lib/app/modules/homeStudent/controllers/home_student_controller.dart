import 'package:get/get.dart';
import 'package:islamify/app/data/models/advertising_data.dart';
import 'package:islamify/app/data/models/juz_data.dart';

class HomeStudentController extends GetxController {
  final contents = <Advertising>[];
  final contentsJuz = <Juz>[];

  HomeStudentController() {
    contents.addAll(advertisingContents);
    contentsJuz.addAll(juzContents);
  }

  List<Advertising> get contentsO => contents;
  List<Juz> get contents1 => contentsJuz;

  final _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  void onPageChanged(int value) {
    _currentPage.value = value;
  }
}
