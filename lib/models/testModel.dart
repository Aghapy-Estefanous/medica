class AvailableTests {
  String? name;
  int? price;
  String? photo;
  AvailableTests(
      {required this.name, required this.price, required this.photo});

  AvailableTests.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    photo = json['photo'];
  }
}
