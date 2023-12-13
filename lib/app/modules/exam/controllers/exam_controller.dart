import 'package:get/get.dart';
import 'package:islamify/app/data/models/exam_data.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ExamController extends GetxController {
  final contentsAllExam = <Exam>[];
  final stt.SpeechToText _speech = stt.SpeechToText();

  // save the exam ID and level ID
  late int examID;
  late int levelID;

  RxBool isRecording = false.obs;
  RxString recognizedText = ''.obs;

  ExamController() {
    final args = Get.arguments;
    examID = args["examID"];
    levelID = args["levelID"];
    contentsAllExam.addAll(examContents);
    // print("Exam ID: ${examID}, Level ID: ${levelID}");
  }

  List<Exam> get contentsExam {
    // filter the exams based on examID
    return contentsAllExam.where((exam) => exam.id == examID).toList();
  }

  Future<void> startListening() async {
    if (!await _speech.initialize()) {
      // print("Failed to initialize speech recognition");
      return;
    }

    await _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          recognizedText.value = result.recognizedWords;
          isRecording.value = false;
          // print(recognizedText);
          // print("selesai ambil data");
        }
      },
      localeId: 'ar-SA',
    );
    // print("Mulai mendengarkan");
  }

  void stopListening() {
    _speech.stop();
    // print("Berhenti mendengarkan");
  }
}
