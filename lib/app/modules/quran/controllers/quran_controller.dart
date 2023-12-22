import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:islamify/app/data/services/api_service.dart';

class QuranController extends GetxController {
  final ApiService apiService = ApiService();
  final AudioPlayer player = AudioPlayer();
  final GetStorage storage = GetStorage();

  // save the specific surah ID
  late int surahID;

  // detail surah
  RxList<Map<String, dynamic>> detailSurah = <Map<String, dynamic>>[].obs;

  // loading active data
  RxBool isLoading = true.obs;

  // add a RxBool property to track the playing state
  RxBool isPlaying = false.obs;

  // add a RxBool property to track bookmark status
  RxBool isBookmarked = false.obs;

  // fetch data from api service
  Future<void> fetchData() async {
    try {
      // loading active data
      isLoading.value = true;

      // request to api service
      var response = await apiService.fetchDetailSurah(surahID);

      // print(response.body);
      if (response.statusCode == 200) {
        // Testing data = null atau kosong
        // var data = null;

        // parses json data into data variables
        var data = json.decode(response.body);
        detailSurah.value = [Map<String, dynamic>.from(data)];
        print(data);
      }

      // delay for 5 milliseconds before setting isLoading to false
      await Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
      );

      // loading data is complete
      isLoading.value = false;
    } catch (e) {
      // print(e);

      // loading data is complete
      isLoading.value = false;
    }
  }

  // play and pause the audio
  Future<void> togglePlayPause(String url) async {
    if (isPlaying.value) {
      await player.pause();
    } else {
      await player.play(
        UrlSource(url),
      );
    }
  }

  // function to toggle bookmark status
  void toggleBookmark() {
    // toggle bookmark status
    isBookmarked.toggle();

    // save bookmark status to local storage
    if (isBookmarked.value) {
      storage.write(
        "bookmark",
        surahID,
      );
    } else {
      storage.remove(
        "bookmark",
      );
    }
  }

  // function to check and set initial bookmark status
  void checkBookmarkStatus() {
    final bookmarkedID = storage.read<int>("bookmark");
    isBookmarked.value = surahID == bookmarkedID;
    // print(bookmarkedID);
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    surahID = args["surahID"];
    fetchData();

    // check and set initial bookmark status
    checkBookmarkStatus();

    player.onPlayerStateChanged.listen(
      (PlayerState state) {
        // update isPlaying based on player state
        isPlaying.value = state == PlayerState.playing;
      },
    );
  }

  @override
  void onClose() {
    player.stop();
    super.onClose();
  }
}
