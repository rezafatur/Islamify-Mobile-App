import 'package:get/get.dart';
import 'package:islamify/app/data/models/reward_data.dart';

class RewardController extends GetxController {
  final contentsAllReward = <Reward>[];

  RewardController() {
    contentsAllReward.addAll(rewardContents);
  }

  List<Reward> get contentsExam => contentsAllReward;
}
