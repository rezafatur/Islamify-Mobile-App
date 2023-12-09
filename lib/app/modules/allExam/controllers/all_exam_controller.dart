import 'package:get/get.dart';
import 'package:islamify/app/data/models/exam_data.dart';

class AllExamController extends GetxController {
  final contentsAllExam = <Exam>[];
  
  AllExamController() {
    contentsAllExam.addAll(examContents);
  }

  List<Exam> get contentsExam => contentsAllExam;
}
