import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:islamify/app/data/models/exam_data.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ExamController extends GetxController {
  final contentsAllExam = <Exam>[];
  final AudioPlayer player = AudioPlayer();
  final stt.SpeechToText _speech = stt.SpeechToText();

  // save the exam ID and level ID
  late int examID;
  late int levelID;

  RxBool isPlaying = false.obs;
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

  // play and pause the audio
  Future<void> togglePlayPause(String url) async {
    if (isPlaying.value) {
      await player.pause();
    } else {
      await player.play(
        AssetSource(url),
        volume: 100,
      );
    }
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

  // method to update the progress when the answer is correct
  void updateProgress() {
    var content = contentsExam[0];
    var level = content.levels[levelID];
    if (recognizedText.value == level.jawaban) {
      // if the answer is correct, update the progress
      content.levels[levelID] = level.updateProgress();

      // update the contentsAllExam list
      contentsAllExam[examID - 1] = content;
    }
    // print(level.progress);
  }

  @override
  void onInit() {
    super.onInit();
    player.onPlayerStateChanged.listen(
      (PlayerState state) {
        // update isPlaying based on player state
        isPlaying.value = state == PlayerState.playing;
      },
    );
  }

  @override
  void onClose() {
    player.stop();
    super.onClose();
  }
}
