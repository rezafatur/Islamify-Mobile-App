import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamify/app/data/models/onboarding_data.dart';
import 'package:islamify/app/modules/login/views/login_view.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import 'package:islamify/core/utils/size_configs.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  // dots Indicator
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
    // initializing the screen width and height
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: cultured,
      body: SafeArea(
        child: Column(
          children: [
            // section - image, title, and description
            Expanded(
              flex: 5,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.contentsOnboarding.length,
                itemBuilder: (context, i) {
                  Onboarding content = controller.contentsOnboarding[i];
                  return Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: [
                        // section - image
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset.zero,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              content.image,
                              height: SizeConfig.blockV! * 35,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // section - title
                        AutoSizeText(
                          content.title,
                          style: winterDreamBold32,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // section - description
                        AutoSizeText(
                          content.description,
                          style: richBlackW30016,
                          textAlign: TextAlign.center,
                          maxLines: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // section - skip, next, and get started button
            Expanded(
              flex: 1,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // section - dots indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.contentsOnboarding.length,
                        (int index) => dotsIndicator(
                          index: index,
                        ),
                      ),
                    ),

                    // section - buttons
                    controller.currentPage + 1 ==
                            controller.contentsOnboarding.length
                        ? // section - get started button
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.completeOnboarding();
                                Get.offAll(
                                  LoginView(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: wintergreenDream,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 20,
                                ),
                              ),
                              child: const AutoSizeText(
                                "Mulai Sekarang",
                                style: whiteBold16,
                                maxLines: 1,
                              ),
                            ),
                          )
                        : // section - skip and next button
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // section - skip button
                                TextButton(
                                  onPressed: () {
                                    controller.pageController.jumpToPage(3);
                                  },
                                  child: const AutoSizeText(
                                    "Lewati",
                                    style: blackBold16,
                                    maxLines: 1,
                                  ),
                                ),

                                // section - next button
                                ElevatedButton(
                                  onPressed: controller.nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: wintergreenDream,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 20,
                                    ),
                                  ),
                                  child: const AutoSizeText(
                                    "Selanjutnya",
                                    style: whiteBold16,
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
    );
  }
}
