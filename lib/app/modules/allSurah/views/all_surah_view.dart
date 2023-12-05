import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/controller/page_index.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/all_surah_controller.dart';

class AllSurahView extends GetView<AllSurahController> {
  AllSurahView({Key? key}) : super(key: key);

  // page controller for home, quran, and profile
  final pageStudent = Get.put<PageIndexController>(
    PageIndexController(),
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
        leading: const Center(
          child: Text(
            "Islamify",
            style: winterDreamBold32,
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width / 2.5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: IgnorePointer(
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            // show loading indicator if data is being loaded
            return const Center(
              child: CircularProgressIndicator(
                color: wintergreenDream,
              ),
            );
          } else if (controller.allSurah.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: opal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "😔😔😔\n\n",
                        children: [
                          TextSpan(
                            text: "Maintenance",
                            style: blackBold16,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Obx(
              () => SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 40,
                  ),
                  child: Column(
                    children: [
                      // section - banner quran
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/bannerQuran.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // section - search surah
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                          style: blackBold12,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: wintergreenDream,
                            ),
                            hintText: "Cari Surah",
                            hintStyle: blackBold12,
                            filled: true,
                            fillColor: cultured,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: wintergreenDream,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: wintergreenDream,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // section - all surah
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            // section - semua surah
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Semua Surah Al - Qur'an",
                                style: blackBold12,
                              ),
                            ),

                            // section - list of all surah
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.allSurah.length,
                              itemBuilder: (context, index) {
                                var surah = controller.allSurah[index];
                                return InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      // section - specific surah
                                      Row(
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/iconNumber.png",
                                                scale: 15,
                                              ),
                                              Text(
                                                surah["nomor"].toString(),
                                                style: blackBold12,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    "${surah["nama_latin"]}\n",
                                                style: blackBold12,
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "${surah["arti"]} • ${surah["jumlah_ayat"].toString()} Ayat",
                                                    style: blackW30012,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "${surah["nama"]}",
                                              style: winterDreamBold20,
                                              textAlign: TextAlign.end,
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
                                          borderRadius:
                                              BorderRadius.circular(1),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
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
        },
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
        initialActiveIndex: pageStudent.pageIndex.value + 1,
        onTap: (int i) => pageStudent.changePage(i),
      ),
    );
  }
}
