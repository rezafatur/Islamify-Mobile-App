import 'dart:convert';
import 'package:get/get.dart';
import 'package:islamify/app/data/services/api_service.dart';

class QuranController extends GetxController {
  final ApiService apiService = ApiService();

  // save the specific surah ID
  late int surahID;

  // detail surah
  RxList<Map<String, dynamic>> detailSurah = <Map<String, dynamic>>[].obs;

  // loading active data
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    surahID = args["surahID"];
    fetchData();
  }

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
}
