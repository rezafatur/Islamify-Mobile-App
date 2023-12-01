import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:islamify/app/controller/ad_helper.dart';
import 'package:islamify/app/data/models/advertising_data.dart';
import 'package:islamify/app/data/models/juz_data.dart';

class HomeStudentController extends GetxController {
  final contents = <Advertising>[];
  final contentsJuz = <Juz>[];

  BannerAd? _bannerAd;

  HomeStudentController() {
    contents.addAll(advertisingContents);
    contentsJuz.addAll(juzContents);
    initGoogleMobileAds();
    loadBannerAd();
  }

  List<Advertising> get contentsO => contents;
  List<Juz> get contents1 => contentsJuz;

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
}
