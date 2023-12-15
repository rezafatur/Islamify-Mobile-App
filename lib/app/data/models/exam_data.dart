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
  final String soal;
  final String jawaban;
  final double progress;

  Level({
    required this.tingkatan,
    required this.soal,
    required this.jawaban,
    required this.progress,
  });
}

List<Exam> examContents = [
  Exam(
    id: 1,
    title: "Mengenal Huruf Hijaiyah",
    description:
        "Menilai kemampuan dalam membaca dan mengenali huruf Hijaiyah dengan akurat dan lancar.",
    image: "assets/images/ujianQuran1.png",
    totalExam: 3,
    levels: [
      Level(
        tingkatan: "Pemula",
        soal: "ا ب",
        jawaban: "ا ب",
        progress: 0,
      ),
      Level(
        tingkatan: "Menengah",
        soal: "ا ب ت",
        jawaban: "ا ب ت",
        progress: 0,
      ),
      Level(
        tingkatan: "Mahir",
        soal: "ا ب ت ث",
        jawaban: "ا ب ت ث",
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
        soal: "ا ب ت ث",
        jawaban: "ا ب ت ث",
        progress: 0,
      ),
      Level(
        tingkatan: "Menengah",
        soal: "ا ب ت ث",
        jawaban: "ا ب ت ث",
        progress: 0,
      ),
      Level(
        tingkatan: "Mahir",
        soal: "ا ب ت ث",
        jawaban: "ا ب ت ث",
        progress: 0,
      ),
    ],
  ),
];
