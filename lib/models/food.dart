class Food {
  String name;
  String image;
  double cal;
  double time;
  double rate;
  int reviews;
  bool isLiked;

  Food({
    required this.name,
    required this.image,
    required this.cal,
    required this.time,
    required this.rate,
    required this.reviews,
    required this.isLiked,
  });
}

final List<Food> foods = [
  Food(
    name: "Analı Kızlı",
    image: "assets/images/anali_kizli.jpg",
    cal: 120,
    time: 15,
    rate: 4.4,
    reviews: 23,
    isLiked: false,
  ),
  Food(
    name: "Karnıyarık",
    image: "assets/images/karniyarik.jpg",
    cal: 140,
    time: 25,
    rate: 4.4,
    reviews: 23,
    isLiked: true,
  ),
  Food(
    name: "Yaprak Sarma",
    image: "assets/images/yapraksarma.jpg",
    cal: 130,
    time: 18,
    rate: 4.2,
    reviews: 10,
    isLiked: false,
  )

];