import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/reward_controller.dart';

class RewardView extends GetView<RewardController> {
  RewardView({Key? key}) : super(key: key);

  @override
  final RewardController controller = Get.put(
    RewardController(),
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
          "Hadiah",
          style: winterDreamBold20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            children: [
              // section - information
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
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
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  // section - reward
                                  const Text(
                                    "Hadiah",
                                    style: whiteBold20,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // section - redeem your points
                                  const Text(
                                    "Tukarkan poin Anda!",
                                    style: whiteW30012,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // section - border
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.25,
                                    decoration: BoxDecoration(
                                      color: cultured,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // section - user points
                                  const Text(
                                    "Poin Anda",
                                    style: whiteW30012,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // section - points
                                  const Text(
                                    "250",
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
              ),

              // section - all rewards
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 260,
                ),
                itemCount: controller.contentsAllReward.length,
                itemBuilder: (context, index) {
                  var reward = controller.contentsAllReward[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: opal,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                reward.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // section - title
                                Text(
                                  reward.title,
                                  style: blackBold10,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                // section - description
                                Text(
                                  reward.description,
                                  style: blackW30010,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                // section - coins and stock
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/iconCoins.png",
                                          scale: 40,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          reward.coins.toString(),
                                          style: blackW30010,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Stok: ${reward.stock.toString()}",
                                      style: blackW30010,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
