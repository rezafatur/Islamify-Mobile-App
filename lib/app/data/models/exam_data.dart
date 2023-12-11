class Exam {
  final int id;
  final String title;
  final String description;
  final String image;
  final int totalExam;
  final List<Level> levels;

  Exam({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.totalExam,
    required this.levels,
  });
}

class Level {
  final String tingkatan;
  final double progress;

  Level({
    required this.tingkatan,
    required this.progress,
  });
}

List<Exam> examContents = [
  Exam(
    id: 1,
    title: "Huruf Hijaiyah",
    description:
        "Menilai kemampuan dalam membaca huruf Hijaiyah dengan akurat dan lancar.",
    image: "assets/images/ujianQuran1.png",
    totalExam: 3,
    levels: [
      Level(
        tingkatan: "Pemula",
        progress: 0,
      ),
      Level(
        tingkatan: "Menengah",
        progress: 0,
      ),
      Level(
        tingkatan: "Mahir",
        progress: 0,
      ),
    ],
  ),
  Exam(
    id: 2,
    title: "Bentuk dan Bacaan Huruf Hijaiyah",
    description:
        "Menilai kemampuan dalam membaca huruf Hijaiyah lainnya dengan akurat dan lancar.",
    image: "assets/images/ujianQuran2.png",
    totalExam: 2,
    levels: [
      Level(
        tingkatan: "Pemula",
        progress: 0,
      ),
      Level(
        tingkatan: "Menengah",
        progress: 0,
      ),
      Level(
        tingkatan: "Mahir",
        progress: 0,
      ),
    ],
  ),
];
