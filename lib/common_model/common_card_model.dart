import 'dart:convert';

CommonCardModel commonCardModelFromJson(String str) =>
    CommonCardModel.fromJson(json.decode(str));

String commonCardModelToJson(CommonCardModel data) =>
    json.encode(data.toJson());

class CommonCardModel {
  String image;
  String subject;
  String totalleacture;

  CommonCardModel({
    required this.image,
    required this.subject,
    required this.totalleacture,
  });

  factory CommonCardModel.fromJson(Map<String, dynamic> json) =>
      CommonCardModel(
        image: json["image"],
        subject: json["subject"],
        totalleacture: json["totalleacture"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "subject": subject,
        "totalleacture": totalleacture,
      };
}

List<CommonCardModel> courseCardList = [
  CommonCardModel(
    image: 'assets/digital_marketing.jpg',
    subject: 'Digital Marketing',
    totalleacture: '12',
  ),
  CommonCardModel(
    image: 'assets/graphics_design.jpg',
    subject: 'Graphics Design',
    totalleacture: '15',
  ),
  CommonCardModel(
    image: 'assets/c.jpg',
    subject: 'C Language',
    totalleacture: '40',
  ),
  CommonCardModel(
    image: 'assets/c++.jpg',
    subject: 'C++ Language',
    totalleacture: '40',
  ),
  CommonCardModel(
    image: 'assets/web_design.jpg',
    subject: 'Web Designing',
    totalleacture: '22',
  ),
  CommonCardModel(
    image: 'assets/python.jpg',
    subject: 'Python Language',
    totalleacture: '35',
  ),
];
