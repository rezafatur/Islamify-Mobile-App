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
    title: "Assalamu'alaikum",
    description:
        "Selamat datang di Islamify, tempat Anda belajar dan memahami Al-Qur'an. Mari mulai perjalanan keagamaan Anda bersama kami! ",
    image: "assets/images/onboarding1.png",
  ),
  Onboarding(
    title: "Edukasi",
    description:
        "Di sini, Anda akan mempelajari tajwid dan harakat dengan cara yang interaktif dan mudah dimengerti. Modul-modul khusus akan membimbing Anda dalam membaca Al-Qur'an dengan benar.",
    image: "assets/images/onboarding2.png",
  ),
  Onboarding(
    title: "Bimbingan",
    description:
        "Dengan fitur bimbingan, Anda dapat memilih Ustadz atau Ustadzah sesuai dengan preferensi Anda. Pembimbing akan membantu Anda dengan penjelasan mendalam tentang Al-Qur'an dan agama Islam.",
    image: "assets/images/onboarding3.png",
  ),
  Onboarding(
    title: "Mulai",
    description:
        "Selamat! Anda siap untuk memulai perjalanan keagamaan Anda bersama Islamify. Ayo mulai membaca Al-Qur'an, pelajari tajwid, dan dapatkan bimbingan langsung.",
    image: "assets/images/onboarding4.png",
  ),
];
