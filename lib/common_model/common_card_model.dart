import 'dart:convert';

CommonCardModel commonCardModelFromJson(String str) =>
    CommonCardModel.fromJson(json.decode(str));

String commonCardModelToJson(CommonCardModel data) =>
    json.encode(data.toJson());

class CommonCardModel {
  String image;
  String subject;
  String totalclass;
  String totalleacture;
  
  CommonCardModel({
    required this.image,
    required this.subject,
    required this.totalclass,
    required this.totalleacture,
  });

  factory CommonCardModel.fromJson(Map<String, dynamic> json) =>
      CommonCardModel(
        image: json["image"],
        subject: json["subject"],
        totalclass: json["totalclass"],
        totalleacture: json["totalleacture"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "subject": subject,
        "totalclass": totalclass,
        "totalleacture": totalleacture,
      };
}

List<CommonCardModel> courseCardList = [
  CommonCardModel(
    image: 'assets/general_math.jpg',
    subject: 'General Math',
    totalleacture: '5',
    totalclass: '9-10',
  ),
  CommonCardModel(
    image: 'assets/general_math.jpg',
    subject: 'General Math',
    totalleacture: '5',
    totalclass: '9-10',
  ),
  CommonCardModel(
    image: 'assets/general_math.jpg',
    subject: 'General Math',
    totalleacture: '5',
    totalclass: '9-10',
  ),
  CommonCardModel(
    image: 'assets/general_math.jpg',
    subject: 'General Math',
    totalleacture: '5',
    totalclass: '9-10',
  ),
  CommonCardModel(
    image: 'assets/general_math.jpg',
    subject: 'General Math',
    totalleacture: '5',
    totalclass: '9-10',
  ),
  CommonCardModel(
    image: 'assets/general_math.jpg',
    subject: 'General Math',
    totalleacture: '5',
    totalclass: '9-10',
  ),
];
