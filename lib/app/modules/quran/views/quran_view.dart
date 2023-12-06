import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamify/app/modules/quran/controllers/quran_controller.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      QuranController(),
    );

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
          "Al - Qur'an",
          style: winterDreamBold20,
        ),
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
          } else if (controller.detailSurah.isEmpty) {
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
                      // section - surah information, bookmark, and audio
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.detailSurah.length,
                        itemBuilder: (context, index) {
                          var surahInfo = controller.detailSurah[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                // section - surah information
                                Row(
                                  children: [
                                    Expanded(
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
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                children: [
                                                  // section - surah name
                                                  Text(
                                                    surahInfo["nama_latin"],
                                                    style: whiteBold20,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),

                                                  // section - meaning of surah
                                                  Text(
                                                    surahInfo["arti"],
                                                    style: whiteW30012,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),

                                                  // section - border
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 0.25,
                                                    decoration: BoxDecoration(
                                                      color: cultured,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),

                                                  // section - place of descent and number of verses
                                                  Text(
                                                    "${surahInfo["tempat_turun"] == "mekah" ? "Makkiyah" : "Madaniyah"} • ${surahInfo["jumlah_ayat"].toString()} Ayat",
                                                    style: whiteW30012,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),

                                                  // section - bismillah
                                                  const Text(
                                                    "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
                                                    style: whiteBold24,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // section - bookmark and audio
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.toggleBookmark();
                                        },
                                        child: Obx(
                                          () => Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: opal,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    controller
                                                            .isBookmarked.value
                                                        ? Icons.bookmark
                                                        : Icons.bookmark_border,
                                                    color: pictonBlue,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    controller
                                                            .isBookmarked.value
                                                        ? "Terakhir Dibaca"
                                                        : "Tandai Dibaca",
                                                    style: blackBold12,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          controller.togglePlayPause(
                                            surahInfo["audio"],
                                          );
                                        },
                                        child: Obx(
                                          () => Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: opal,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    controller.isPlaying.value
                                                        ? Icons.pause
                                                        : Icons.play_arrow,
                                                    color: sunsetOrange,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    controller.isPlaying.value
                                                        ? "Jeda Audio"
                                                        : "Mulai Audio",
                                                    style: blackBold12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      // section - detail surah
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.detailSurah.isNotEmpty
                              ? controller.detailSurah[0]["ayat"].length
                              : 0,
                          itemBuilder: (context, index) {
                            if (controller.detailSurah.isNotEmpty &&
                                index <
                                    controller.detailSurah[0]["ayat"].length) {
                              var ayat =
                                  controller.detailSurah[0]["ayat"][index];
                              return Column(
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
                                            NumberFormat.decimalPattern("ar_EG")
                                                .format(
                                              int.parse(
                                                ayat["nomor"].toString(),
                                              ),
                                            ),
                                            style: blackBold12,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${ayat["ar"]}",
                                          style: blackBold24,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // section - translation
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      ayat["tr"],
                                      style: blackBold12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // section - translation in Bahasa Indonesia
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      ayat["idn"],
                                      style: blackW30010,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // section - border
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.25,
                                    decoration: BoxDecoration(
                                      color: wintergreenDream,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
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
    );
  }
}
