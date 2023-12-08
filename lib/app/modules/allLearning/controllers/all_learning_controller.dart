import 'package:get/get.dart';
import 'package:islamify/app/data/models/learning_quran_data.dart';

class AllLearningController extends GetxController {
  final contentsLearning = <Learning>[];
  
  AllLearningController() {
    contentsLearning.addAll(learningContents);
  }

  List<Learning> get contentsLearn => contentsLearning;
}
