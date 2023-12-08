import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamify/app/controller/ad_helper.dart';
import 'package:islamify/app/data/models/learning_quran_data.dart';

class HomeController extends GetxController {
  final contentsLearning = <Learning>[];

  BannerAd? _bannerAd;

  HomeController() {
    contentsLearning.addAll(learningContents);
    initGoogleMobileAds();
    loadBannerAd();
  }

  List<Learning> get contentsLearn => contentsLearning;

  final _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  void onPageChanged(int value) {
    _currentPage.value = value;
  }

  // Initialize Google Mobile Ads SDK
  Future<InitializationStatus> initGoogleMobileAds() async {
    return MobileAds.instance.initialize();
  }

  void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _bannerAd = ad as BannerAd;
          // update();
        },
        onAdFailedToLoad: (ad, err) {
          // print('Failed to load a banner ad: ${err.message}');
          // print('Ad unit ID: ${ad.adUnitId}');
          ad.dispose();
        },
      ),
    )..load();
  }

  BannerAd? get bannerAd => _bannerAd;

  @override
  void dispose() {
    // Dispose BannerAd object
    _bannerAd?.dispose();
    super.dispose();
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour >= 5 && hour < 11) {
      return "Selamat Pagi 👋😁\n";
    } else if (hour < 15) {
      return "Selamat Siang 👋😁\n";
    } else if (hour < 18) {
      return "Selamat Sore 👋😁\n";
    } else {
      return "Selamat Malam 👋😁\n";
    }
  }
}
