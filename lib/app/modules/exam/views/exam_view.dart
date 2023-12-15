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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              var content = controller.contentsExam[0];
              var level = content.levels[controller.levelID];
              return Column(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Level ${level.tingkatan}",
                                        style: whiteBold20,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
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
                          child: Padding(
                            padding: const EdgeInsets.all(50),
                            child: Center(
                              child: Text(
                                level.soal,
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
                              padding: const EdgeInsets.all(100),
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

                  // section - display the pop-up
                  Obx(
                    () {
                      if (controller.recognizedText.isNotEmpty) {
                        // compare recognized text with the correct answer
                        var content = controller.contentsExam[0];
                        var level = content.levels[controller.levelID];
                        String correctAnswer = level.jawaban;

                        if (controller.recognizedText.value == correctAnswer) {
                          // if answer is correct, then show pop-up
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) {
                              Get.dialog(
                                AlertDialog(
                                  backgroundColor: cultured,
                                  elevation: 5,
                                  title: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: msuGreen,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/bannerJawaban.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  const Text(
                                                    "🤩",
                                                    style: whiteBold60,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    "Selamat!",
                                                    style: whiteBold18,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    "Jawaban Anda benar 👏😁",
                                                    style: whiteW30012,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: cultured,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 25,
                                                                width: 25,
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/iconPoints.png",
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              RichText(
                                                                text:
                                                                    const TextSpan(
                                                                  text:
                                                                      "Poin Anda\n",
                                                                  style:
                                                                      blackW30012,
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          "+ 1000",
                                                                      style:
                                                                          blackBold12,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      // section - back button
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: msuGreen,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Kembali",
                                                  style: whiteBold12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          // if answer is incorrect, then show pop-up
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) {
                              Get.dialog(
                                AlertDialog(
                                  backgroundColor: cultured,
                                  elevation: 5,
                                  title: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: msuGreen,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/bannerJawaban.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "😔",
                                                    style: whiteBold60,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Maaf!",
                                                    style: whiteBold18,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Jawaban Anda salah 🙏😔",
                                                    style: whiteW30012,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      // section - back button
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: msuGreen,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Kembali",
                                                  style: whiteBold12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                      // return an empty container if no recognized text
                      return Container();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
