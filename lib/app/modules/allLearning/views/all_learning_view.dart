import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/data/models/learning_quran_data.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/all_learning_controller.dart';

class AllLearningView extends GetView<AllLearningController> {
  AllLearningView({Key? key}) : super(key: key);

  @override
  final AllLearningController controller = Get.put(
    AllLearningController(),
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
          "Semua Pelajaran",
          style: winterDreamBold20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // section - main content learning
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.contentsLearn.length,
                itemBuilder: (context, index) {
                  Learning content = controller.contentsLearn[index];
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        // section - content learning
                        Row(
                          children: [
                            // section - image
                            Expanded(
                              flex: 1,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      content.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: opal,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: Text(
                                          content.material,
                                          style: blackW30012,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),

                            // section - title, description, and lessons
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    content.title,
                                    style: blackBold10,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    content.description,
                                    style: blackW30010,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/iconLesson.png",
                                        scale: 40,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${content.lesson.toString()} pelajaran",
                                        style: blackW30010,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // section - border
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 0.25,
                          decoration: BoxDecoration(
                            color: wintergreenDream,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
