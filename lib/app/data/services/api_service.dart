import 'package:http/http.dart' as http;

class ApiService {
  // url api equran.id
  final baseUrl = "https://equran.id";

  // get - list of all surah
  Future<http.Response> fetchAllSurah() async {
    try {
      // url api equran.id for all surah
      var url = "$baseUrl/api/surat";

      // http get request to url
      var response = await http.get(
        Uri.parse(url),
      );

      return response;
    } catch (e) {
      // print(e);
      return http.Response("Error", 500);
    }
  }

  // get - specific surah
  Future<http.Response> fetchDetailSurah(int numberSurah) async {
    try {
      // url api equran.id for specific surah details
      var url = "$baseUrl/api/surat/$numberSurah";

      // http get request to url
      var response = await http.get(
        Uri.parse(url),
      );

      return response;
    } catch (e) {
      print(e);
      return http.Response("Error", 500);
    }
  }
}
