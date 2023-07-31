class Onboarding {
  final String title;
  final String description;
  final String image;

  Onboarding({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<Onboarding> onboardingContents = [
  Onboarding(
    title: "Welcome".toUpperCase(),
    description:
        "Discover the Islamic world with Quran and prayer times on Islamify.",
    image: "assets/images/onboarding1.png",
  ),
  Onboarding(
    title: "Explore".toUpperCase(),
    description:
        "Delve into the depths of Al Quran and explore the beauty of its verses, with accurate prayer times for your location on Islamify.",
    image: "assets/images/onboarding2.png",
  ),
  Onboarding(
    title: "Connect".toUpperCase(),
    description:
        "Connect with your faith, the Quran, and your prayers in one place with Islamify.",
    image: "assets/images/onboarding3.png",
  ),
  Onboarding(
    title: "Empower".toUpperCase(),
    description:
        "Empower your spiritual journey with Islamify's comprehensive features, providing access to the Quran and timely prayer reminders.",
    image: "assets/images/onboarding4.png",
  ),
];
