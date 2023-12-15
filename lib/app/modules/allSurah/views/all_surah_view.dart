import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/controller/page_index.dart';
import 'package:islamify/app/modules/quran/views/quran_view.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: cultured,
        elevation: 5,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Islamify",
              style: winterDreamBold24,
            ),
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width,
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
                      // const SizedBox(
                      //   height: 20,
                      // ),

                      // section - search surah
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 20,
                      //   ),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Expanded(
                      //         child: InkWell(
                      //           onTap: () {},
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(10),
                      //               border: Border.all(
                      //                 color: wintergreenDream,
                      //                 width: 2,
                      //               ),
                      //             ),
                      //             child: const Padding(
                      //               padding: EdgeInsets.symmetric(
                      //                 horizontal: 20,
                      //                 vertical: 10,
                      //               ),
                      //               child: Row(
                      //                 children: [
                      //                   Icon(
                      //                     Icons.search,
                      //                     color: wintergreenDream,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 10,
                      //                   ),
                      //                   Text(
                      //                     "Cari Surah",
                      //                     style: blackBold12,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // section - bookmark
                      // ignore: unrelated_type_equality_checks
                      if (controller.bookmarkedID == 0)
                        const SizedBox()
                      else
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        var bookmarkID =
                                            controller.bookmarkedID.toInt();
                                        var surah = controller
                                            .allSurah[bookmarkID.toInt() - 1];
                                        return InkWell(
                                          onTap: () {
                                            Get.to(
                                              () => const QuranView(),
                                              arguments: {
                                                "surahID": surah["nomor"],
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/bannerSurah.png",
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Column(
                                                      children: [
                                                        // section - surah
                                                        Text(
                                                          surah["nama_latin"],
                                                          style: whiteBold20,
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),

                                                        // section - info
                                                        const Text(
                                                          "Bacaan Terakhir",
                                                          style: whiteW30012,
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),

                                                        // section - border
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 0.25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: cultured,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),

                                                        // section - meaning and number of verses
                                                        Text(
                                                          "${surah["arti"]} • ${surah["jumlah_ayat"].toString()} Ayat",
                                                          style: whiteW30012,
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),

                                                        // section - bismillah
                                                        const Text(
                                                          "Lanjutkan Bacaan",
                                                          style: whiteBold24,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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
                                  onTap: () {
                                    Get.to(
                                      () => const QuranView(),
                                      arguments: {
                                        "surahID": surah["nomor"],
                                      },
                                    );
                                  },
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
                                            flex: 2,
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    "${surah["nama_latin"]}\n",
                                                style: blackBold12,
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "${surah["arti"]} • ${surah["jumlah_ayat"].toString()} Ayat",
                                                    style: blackW30010,
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
