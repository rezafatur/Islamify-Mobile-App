import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamify/app/data/models/onboarding_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  final contents = <Onboarding>[];

  OnboardingController() {
    contents.addAll(onboardingContents);
  }

  List<Onboarding> get contentsOnboarding => contents;

  final _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  final _pageController = PageController();
  PageController get pageController => _pageController;

  void onPageChanged(int value) {
    _currentPage.value = value;
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(
        milliseconds: 200,
      ),
      curve: Curves.easeIn,
    );
  }

  void completeOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarding_completed", true);
  }
}
