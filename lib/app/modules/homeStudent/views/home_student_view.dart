import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/data/models/advertising_data.dart';
import 'package:islamify/app/data/models/juz_data.dart';
import 'package:islamify/core/theme/text_theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../core/theme/colors.dart';
import '../controllers/home_student_controller.dart';

class HomeStudentView extends GetView<HomeStudentController> {
  HomeStudentView({Key? key}) : super(key: key);

  @override
  final HomeStudentController controller = Get.put(
    HomeStudentController(),
  );

  // Dots Indicator
  AnimatedContainer dotsIndicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: controller.currentPage == index ? wintergreenDream : opal,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      height: 10,
      curve: Curves.easeIn,
      width: controller.currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackGray,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: azureishWhite,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        leading: const Center(
          child: Text(
            "Islamify",
            style: msuGreenBold32,
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width / 2.5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        0.25,
                      ),
                      offset: Offset.zero,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/profile.png",
                  scale: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: kToolbarHeight,
            bottom: kToolbarHeight,
          ),
          child: Obx(
            () => Column(
              children: [
                // section - background and advertising
                SizedBox(
                  height: 250,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/bgHome.png",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                        ),
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          onPageChanged: controller.onPageChanged,
                          itemCount: controller.contentsO.length,
                          itemBuilder: (context, i) {
                            Advertising content = controller.contentsO[i];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  content.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // section - dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.contentsO.length,
                    (int index) => dotsIndicator(
                      index: index,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // section - icon menu
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/iconAlquran.png",
                              scale: 8,
                            ),
                            const Text(
                              "Al-Qur'an",
                              style: msuGreenBold12,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/iconJadwal.png",
                              scale: 8,
                            ),
                            const Text(
                              "Jadwal",
                              style: msuGreenBold12,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/iconRekomendasi.png",
                              scale: 8,
                            ),
                            const Text(
                              "Rekomendasi",
                              style: msuGreenBold12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // section - progress juz
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
                            "Progress Juz",
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
                        height: 202,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.contents1.length > 5
                              ? 6
                              : controller.contents1.length,
                          itemBuilder: (context, index) {
                            Juz content = controller.contents1[index];
                            if (index == 5 && controller.contents1.length > 5) {
                              return InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  width: 150,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: columbiaBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                width: 150,
                                decoration: BoxDecoration(
                                  color: columbiaBlue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          content.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        content.title,
                                        style: blackBold10,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 2000,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.3),
                                        barRadius: const Radius.circular(5),
                                        center: Text(
                                          "${content.percentage.toInt()}%", // Mengubah double menjadi int untuk menampilkan persentase tanpa desimal
                                          style: blackW30010,
                                        ),
                                        lineHeight: 15,
                                        percent: content.percentage / 100,
                                        progressColor: msuGreen,
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
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                // section - jadwal terdekat
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
                            "Jadwal Terdekat",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: columbiaBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/jadwalTerdekat.png",
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kelas A",
                                      style: msuGreenBold12,
                                    ),
                                    Text(
                                      "Tajwid Al-Qur'an",
                                      style: msuGreenBold12,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 80,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                "assets/images/iconSearch.png",
                                                fit: BoxFit.contain,
                                                scale: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                "assets/images/iconChat.png",
                                                fit: BoxFit.contain,
                                                scale: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                "assets/images/iconMoney.png",
                                                fit: BoxFit.contain,
                                                scale: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // section - bottom navigation
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: columbiaBlue,
        style: TabStyle.react,
        height: kToolbarHeight * 0.75,
        items: [
          TabItem(
            icon: Image.asset(
              "assets/images/iconHome.png",
            ),
            activeIcon: Image.asset(
              "assets/images/iconHomeSelected.png",
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconSchedule.png",
            ),
            activeIcon: Image.asset(
              "assets/images/iconScheduleSelected.png",
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconUser.png",
            ),
            activeIcon: Image.asset(
              "assets/images/iconUserSelected.png",
            ),
          ),
        ],
      ),
    );
  }
}
