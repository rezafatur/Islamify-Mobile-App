class Learning {
  final String material;
  final String title;
  final String description;
  final String image;
  final int lesson;

  Learning({
    required this.material,
    required this.title,
    required this.description,
    required this.image,
    required this.lesson,
  });
}

List<Learning> learningContents = [
  Learning(
    material: "Materi 1",
    title: "Belajar Huruf Hijaiyah",
    description: "Belajar membaca, mengetahui, dan mengucapkan huruf Hijaiyah.",
    image: "assets/images/belajarQuran1.png",
    lesson: 3,
  ),
  Learning(
    material: "Materi 2",
    title: "Belajar Bentuk dan Bacaan Huruf Hijaiyah",
    description: "Mempelajari bentuk-bentuk lain dari huruf Hijaiyah.",
    image: "assets/images/belajarQuran2.png",
    lesson: 2,
  ),
];
