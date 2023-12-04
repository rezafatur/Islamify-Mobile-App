import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamify/app/controller/page_index_student.dart';
import 'package:islamify/app/data/models/learning_quran_data.dart';
import 'package:islamify/app/modules/home/controllers/home_controller.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(
    HomeController(),
  );

  // page controller for home, quran, and profile page
  final pageStudent = Get.put<PageIndexStudentController>(
    PageIndexStudentController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cultured,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cultured,
        elevation: 5,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        title: const Center(
          child: Text(
            "Islamify",
            style: winterDreamBold32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 40,
          ),
          child: Column(
            children: [
              // section - greetings and profile
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: RichText(
                        text: const TextSpan(
                          text: "Selamat Pagi! 👋😁\n",
                          style: blackW30018,
                          children: [
                            TextSpan(
                              text: "Dimas",
                              style: blackBold24,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/profile.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // section - banner ads islamify
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/bannerIslamify.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // section - belajar membaca al-qur'an
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Ayo belajar membaca Al-Qur'an!",
                          style: blackBold12,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Lihat Semua",
                            style: pictonBlueBold12,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 321,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.contentsLearn.length > 5
                            ? 6
                            : controller.contentsLearn.length,
                        itemBuilder: (context, index) {
                          Learning content = controller.contentsLearn[index];
                          if (index == 5 &&
                              controller.contentsLearn.length > 5) {
                            return InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: opal,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward,
                                        color: msuGreen,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Lihat Semua",
                                        style: msuGreenBold12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: opal,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      content.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // section - al-qur'an digital
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ayo belajar membaca Al-Qur'an!",
                        style: blackBold12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/bannerQuran.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // section - ad banner
              if (controller.bannerAd != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: controller.bannerAd!.size.width.toDouble(),
                      height: controller.bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: controller.bannerAd!),
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),

      // section - bottom navigation
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: opal,
        style: TabStyle.react,
        height: kToolbarHeight * 0.75,
        items: [
          TabItem(
            icon: Image.asset(
              "assets/images/iconHome.png",
              scale: 15,
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconQuran.png",
              scale: 15,
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconProfile.png",
              scale: 15,
            ),
          ),
        ],
        initialActiveIndex: pageStudent.pageIndex.value,
        onTap: (int i) => pageStudent.changePage(i),
      ),
    );
  }
}
