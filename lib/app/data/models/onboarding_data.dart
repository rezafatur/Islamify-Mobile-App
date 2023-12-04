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
    title: "Assalamualaikum",
    description:
        "Selamat datang di Islamify, tempat Anda belajar dan memahami Al-Qur'an. Mari mulai proses pembelajaran Anda bersama Islamify!",
    image: "assets/images/onboarding1.png",
  ),
  Onboarding(
    title: "Edukasi",
    description:
        "Disini, Anda akan mempelajari huruf hijaiyah, tajwid, dan harakat dengan cara yang interaktif dan mudah dimengerti. Modul-modul khusus akan membimbing Anda dalam membaca Al-Qur'an dengan benar.",
    image: "assets/images/onboarding2.png",
  ),
  Onboarding(
    title: "Digital",
    description:
        "Selain fitur edukasi, Anda dapat membaca Al-Qur'an secara digital atau langsung dari aplikasi Islamify.",
    image: "assets/images/onboarding3.png",
  ),
  Onboarding(
    title: "Mulai",
    description:
        "Selamat! Anda siap untuk memulai pembelajaran Anda bersama Islamify. Ayo mulai membaca Al-Qur'an secara digital, pelajari huruf hijayah, tajwid, dan harakat secara interaktif melalui aplikasi Islamify. ",
    image: "assets/images/onboarding4.png",
  ),
];
