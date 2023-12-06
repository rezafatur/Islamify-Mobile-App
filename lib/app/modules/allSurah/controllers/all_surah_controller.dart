import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:islamify/app/data/services/api_service.dart';

class AllSurahController extends GetxController {
  final ApiService apiService = ApiService();
  final GetStorage storage = GetStorage();

  // list of all surah
  RxList<Map<String, dynamic>> allSurah = <Map<String, dynamic>>[].obs;

  // loading active data
  RxBool isLoading = true.obs;

  // fetch data from api service
  Future<void> fetchData() async {
    try {
      // loading active data
      isLoading.value = true;

      // request to api service
      var response = await apiService.fetchAllSurah();

      // print(response.body);
      if (response.statusCode == 200) {
        // Testing data = null atau kosong
        // var data = null;

        // parses json data into data variables
        var data = json.decode(response.body);
        allSurah.value = List<Map<String, dynamic>>.from(data);
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

  // Property to store bookmarkedID
  RxInt bookmarkedID = RxInt(0);

  // function to check and set initial bookmark status
  void checkBookmarkStatus() {
    var storedID = storage.read<int>("bookmark");
    bookmarkedID.value = storedID ?? 0;
    print(bookmarkedID.value);
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();

    // check and set initial bookmark status
    checkBookmarkStatus();
  }
}
