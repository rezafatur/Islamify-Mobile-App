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
        "Selamat datang di Islamify, tempat Anda menguji dan memahami bacaan Al-Qur'an. Mari mulai proses tersebut bersama Islamify!",
    image: "assets/images/onboarding1.png",
  ),
  Onboarding(
    title: "Ujian",
    description:
        "Disini, Anda akan diuji untuk membaca huruf Hijaiyah, tajwid, dan harakat dengan cara yang interaktif dan mudah dimengerti.",
    image: "assets/images/onboarding2.png",
  ),
  Onboarding(
    title: "Digital",
    description:
        "Selain fitur ujian, Anda dapat membaca Al-Qur'an secara digital atau langsung dari aplikasi Islamify.",
    image: "assets/images/onboarding3.png",
  ),
  Onboarding(
    title: "Mulai",
    description:
        "Selamat! Anda siap untuk memulai latihan Anda bersama Islamify. Ayo mulai membaca Al-Qur'an secara digital, latih kemampuan membaca huruf Hijaiyah, tajwid, dan harakat secara interaktif melalui aplikasi Islamify.",
    image: "assets/images/onboarding4.png",
  ),
];
