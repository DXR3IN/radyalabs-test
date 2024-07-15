class Food {
  final String name;
  final String image;
  final String desc;

  Food({required this.name, required this.image, required this.desc});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
    );
  }
}
