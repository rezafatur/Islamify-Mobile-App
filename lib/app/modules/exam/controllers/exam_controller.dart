import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ExamController extends GetxController {
  final stt.SpeechToText _speech = stt.SpeechToText();
  RxBool isRecording = false.obs;
  RxString recognizedText = ''.obs;

  Future<void> startListening() async {
    if (!await _speech.initialize()) {
      print("Failed to initialize speech recognition");
      return;
    }

    await _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          recognizedText.value = result.recognizedWords;
          isRecording.value = false;
          print(recognizedText);
          print("selesai ambil data");
        }
      },
      localeId: 'id_ID',
    );
    print("Mulai mendengarkan");
  }

  void stopListening() {
    _speech.stop();
    print("Berhenti mendengarkan");
  }
}
