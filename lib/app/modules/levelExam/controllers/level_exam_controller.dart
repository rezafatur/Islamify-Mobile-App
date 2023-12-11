import 'package:get/get.dart';
import 'package:islamify/app/data/models/exam_data.dart';

class LevelExamController extends GetxController {
  final contentsAllExam = <Exam>[];

  // save the exam ID
  late int examID;

  LevelExamController() {
    final args = Get.arguments;
    examID = args["examID"];
    contentsAllExam.addAll(examContents);
  }

  List<Exam> get contentsExam {
    // Filter the exams based on examID
    return contentsAllExam.where((exam) => exam.id == examID).toList();
  }
}
