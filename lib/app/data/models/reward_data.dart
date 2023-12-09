class Reward {
  final String title;
  final String description;
  final String image;
  final int coins;
  final int stock;

  Reward({
    required this.title,
    required this.description,
    required this.image,
    required this.coins,
    required this.stock,
  });
}

List<Reward> rewardContents = [
  Reward(
    title: "Al-Qur'an Mushaf Asli Madinah Ukuran Sedang A5",
    description: "Mushaf Al-Quran ini dicetak dengan rapi, bersih, dan jelas.",
    image: "assets/images/reward1.png",
    coins: 10000,
    stock: 3,
  ),
  Reward(
    title: "Sajadah Berkualitas Tinggi",
    description:
        "Dapatkan sajadah yang nyaman dan berkualitas tinggi untuk meningkatkan kenyamanan ibadah Anda.",
    image: "assets/images/reward2.png",
    coins: 7500,
    stock: 50,
  ),
  Reward(
    title: "Buku Imam Al-Bukhari: Biografi Lengkap Imam Hadits Terkemuka",
    description:
        "Membedah secara menyeluruh segala hal tentang Imam al-Bukhari, mulai dari riwayat hidupnya, mazhab yang dianutnya, karya-karyanya, spesialisasinya, dan nasihat-nasihatnya.",
    image: "assets/images/reward3.png",
    coins: 6000,
    stock: 20,
  ),
  Reward(
    title: "Buku Intisari Tafsir Al-Qur'an Rahasia Keagungan Ayat Pilihan",
    description:
        "Buku ini mengulas ayat-ayat penting dalam al-Qur'an yang bisa dikatakan mewakili ayat-ayat lainnya. Isinya disusun secara tematik agar memudahkan pembaca.",
    image: "assets/images/reward1.png",
    coins: 4800,
    stock: 2,
  ),
];
