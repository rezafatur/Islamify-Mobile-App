import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/modules/exam/views/exam_view.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/level_exam_controller.dart';

class LevelExamView extends GetView<LevelExamController> {
  LevelExamView({Key? key}) : super(key: key);

  @override
  final LevelExamController controller = Get.put(
    LevelExamController(),
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
          "Level Ujian",
          style: winterDreamBold20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // section - banner exam level
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/bannerExamLevel1.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // section - total exam, points, and progress level
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  var content = controller.contentsExam[0];

                  // Calculate average progress
                  double totalProgress = (content.levels[0].progress +
                          content.levels[1].progress +
                          content.levels[2].progress) /
                      3;

                  return Column(
                    children: [
                      // section - total exam & points
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
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.library_books,
                                      size: 35,
                                      color: opal,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Total Ujian\n",
                                        style: blackW30012,
                                        children: [
                                          TextSpan(
                                            text: content.totalExam.toString(),
                                            style: blackBold12,
                                          )
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
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: Image.asset(
                                        "assets/images/iconPoints.png",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        text: "Poin Anda\n",
                                        style: blackW30012,
                                        children: [
                                          TextSpan(
                                            text: "250",
                                            style: blackBold12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // section - progress indicator
                      Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Kemajuan",
                                  style: blackBold12,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${(totalProgress * 100).round()}% Selesai",
                                  style: blackW30012,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: LinearProgressIndicator(
                                backgroundColor: opal,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    msuGreen),
                                value: totalProgress,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),

              // section - all exam level
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.contentsExam[0].levels.length,
                itemBuilder: (context, index) {
                  var content = controller.contentsExam[0];
                  var level = content.levels[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => ExamView(),
                            arguments: {
                              "examID": controller.examID,
                              "levelID": index,
                            },
                          );
                        },
                        child: Column(
                          children: [
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
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.library_books,
                                                  size: 35,
                                                  color: opal,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text:
                                                        "Ujian ke-${(index + 1).toString()}\n",
                                                    style: blackBold12,
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            "Level ${level.tingkatan}",
                                                        style: blackW30012,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.play_circle_fill,
                                                  size: 35,
                                                  color: opal,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
