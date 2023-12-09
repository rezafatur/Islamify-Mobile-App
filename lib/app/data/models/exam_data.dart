class Exam {
  final String title;
  final String description;
  final String image;
  final int exam;

  Exam({
    required this.title,
    required this.description,
    required this.image,
    required this.exam,
  });
}

List<Exam> examContents = [
  Exam(
    title: "Huruf Hijaiyah",
    description: "Menilai kemampuan dalam membaca huruf Hijaiyah dengan akurat dan lancar.",
    image: "assets/images/ujianQuran1.png",
    exam: 3,
  ),
  Exam(
    title: "Bentuk dan Bacaan Huruf Hijaiyah",
    description: "Menilai kemampuan dalam membaca huruf Hijaiyah lainnya dengan akurat dan lancar.",
    image: "assets/images/ujianQuran2.png",
    exam: 2,
  ),
];
