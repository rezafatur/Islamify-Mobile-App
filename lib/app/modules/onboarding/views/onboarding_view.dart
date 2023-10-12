import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamify/app/data/models/onboarding_data.dart';
import 'package:islamify/app/modules/home/views/home_view.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import 'package:islamify/core/utils/size_configs.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  // Dots Indicator
  AnimatedContainer dotsIndicator({int? index, required bool isDarkMode}) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: controller.currentPage == index
            ? isDarkMode
                ? azureishWhite
                : msuGreen
            : opal,
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
    // Initializing the screen width and height
    SizeConfig().init(context);

    // Determine the current theme mode (light or dark)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Set the background color based on the theme mode
    Color bgColor = isDarkMode ? Colors.black : azureishWhite;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Section image, title, and description
            Expanded(
              flex: 5,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.contentsO.length,
                itemBuilder: (context, i) {
                  Onboarding content = controller.contentsO[i];
                  return Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: [
                        // Section - Image
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isDarkMode ? azureishWhite : msuGreen,
                              width: 5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset.zero,
                                blurRadius: isDarkMode ? 0 : 10,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              content.image,
                              height: SizeConfig.blockV! * 35,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Section - Title
                        AutoSizeText(
                          content.title,
                          style:
                              isDarkMode ? azureishWhiteBold32 : msuGreenBold32,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Section - Description
                        AutoSizeText(
                          content.description,
                          style: isDarkMode ? whiteW30016 : blackW30016,
                          textAlign: TextAlign.center,
                          maxLines: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Section skip, next, and get started button
            Expanded(
              flex: 1,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Section - Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.contentsO.length,
                        (int index) => dotsIndicator(
                          index: index,
                          isDarkMode: isDarkMode,
                        ),
                      ),
                    ),

                    // Section - Buttons
                    controller.currentPage + 1 == controller.contentsO.length
                        ? // Section - Get Started button
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.completeOnboarding();
                                Get.offAll(
                                  const HomeView(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isDarkMode ? azureishWhite : msuGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 20,
                                ),
                              ),
                              child: AutoSizeText(
                                "Mulai Sekarang",
                                style: isDarkMode ? blackBold16 : whiteBold16,
                                maxLines: 1,
                              ),
                            ),
                          )
                        : // Section - Skip and Next button
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Section - Skip button
                                TextButton(
                                  onPressed: () {
                                    controller.pageController.jumpToPage(3);
                                  },
                                  child: AutoSizeText(
                                    "Lewati",
                                    style:
                                        isDarkMode ? whiteBold16 : blackBold16,
                                    maxLines: 1,
                                  ),
                                ),

                                // Section - Next button
                                ElevatedButton(
                                  onPressed: controller.nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        isDarkMode ? azureishWhite : msuGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 20,
                                    ),
                                  ),
                                  child: AutoSizeText(
                                    "Selanjutnya",
                                    style:
                                        isDarkMode ? blackBold16 : whiteBold16,
                                    maxLines: 1,
                                  ),
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
      ),
      backgroundColor: bgColor,
    );
  }
}
