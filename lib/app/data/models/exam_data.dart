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

  // method to update the progress
  Exam updateLevelProgress(int levelIndex) {
    List<Level> updatedLevels = List.from(levels);
    updatedLevels[levelIndex] = levels[levelIndex].updateProgress();

    return Exam(
      id: id,
      title: title,
      description: description,
      image: image,
      totalExam: totalExam,
      levels: updatedLevels,
    );
  }
}

class Level {
  final String tingkatan;
  final String soal;
  final String jawaban;
  final String audio;
  final double progress;

  Level({
    required this.tingkatan,
    required this.soal,
    required this.jawaban,
    required this.audio,
    required this.progress,
  });

  // method to update the progress
  Level updateProgress() {
    return Level(
      tingkatan: tingkatan,
      soal: soal,
      jawaban: jawaban,
      audio: audio,
      progress: 1,
    );
  }
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
        audio: "audio/exam1_part1.mp3",
        progress: 0,
      ),
      Level(
        tingkatan: "Menengah",
        soal: "ا ب ت",
        jawaban: "ا ب ت",
        audio: "audio/exam1_part2.mp3",
        progress: 0,
      ),
      Level(
        tingkatan: "Mahir",
        soal: "ا ب ت ث",
        jawaban: "ا ب ت ث",
        audio: "audio/exam1_part3.mp3",
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
        soal: "ا ب",
        jawaban: "ا ب",
        audio: "audio/exam1_part1.mp3",
        progress: 0,
      ),
      Level(
        tingkatan: "Menengah",
        soal: "ا ب ت",
        jawaban: "ا ب ت",
        audio: "audio/exam1_part2.mp3",
        progress: 0,
      ),
      Level(
        tingkatan: "Mahir",
        soal: "ا ب ت ث",
        jawaban: "ا ب ت ث",
        audio: "audio/exam1_part3.mp3",
        progress: 0,
      ),
    ],
  ),
];
