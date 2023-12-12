import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/exam_controller.dart';

class ExamView extends GetView<ExamController> {
  ExamView({Key? key}) : super(key: key);

  @override
  final ExamController controller = Get.put(
    ExamController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cultured,
      appBar: AppBar(
        backgroundColor: cultured,
        elevation: 5,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(
          color: wintergreenDream,
        ),
        title: const Text(
          "Ujian",
          style: winterDreamBold20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              // section - level information
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/bannerSurah.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Level Pemula",
                                    style: whiteBold20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Bacalah dengan suara pendek!",
                                    style: whiteW30012,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // section - question
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: opal,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(75),
                        child: Center(
                          child: Text(
                            "ﺁ بَ",
                            style: blackBoldArabic24,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // section - information and audio
              Row(
                children: [
                  // section - information
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/bannerSurah.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Ucapkan bacaan di atas!",
                                        style: whiteBold12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  // section - audio
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: opal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.volume_up,
                                size: 30,
                                color: pictonBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // section - voice recorder
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: opal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(84),
                          child: InkWell(
                            onTap: () async {
                              if (controller.isRecording.value) {
                                controller.stopListening();
                              } else {
                                await controller.startListening();
                                controller.isRecording.value = false;
                              }
                              controller.isRecording.toggle();
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.isRecording.value
                                    ? sunsetOrange
                                    : msuGreen,
                              ),
                              child: Center(
                                child: Icon(
                                  controller.isRecording.value
                                      ? Icons.add_box
                                      : Icons.mic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
