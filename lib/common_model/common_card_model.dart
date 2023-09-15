// CommonCardModel commonCardModelFromJson(String str) =>
//     CommonCardModel.fromJson(json.decode(str));

// String commonCardModelToJson(CommonCardModel data) =>
//     json.encode(data.toJson());

class CommonCardModel {
  String image;
  String subject;
  String totalleacture;
  String days;
  String price;
  String totalCourseSell;
  String totalReview;
  String courseRate;
  String totalHours;

  CommonCardModel({
    required this.image,
    required this.subject,
    required this.totalleacture,
    required this.days,
    required this.price,
    required this.totalCourseSell,
    required this.courseRate,
    required this.totalReview,
    required this.totalHours,
  });

  factory CommonCardModel.fromJson(Map<String, dynamic> json) =>
      CommonCardModel(
        image: json["image"],
        subject: json["subject"],
        totalleacture: json["totalleacture"],
        days: json['days'],
        price: json['price'],
        totalCourseSell: json['totalCourseSell'],
        courseRate: json['courseRate'],
        totalReview: json['totalReview'],
        totalHours: json['totalHours'],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "subject": subject,
        "totalleacture": totalleacture,
        'days': days,
        'price': price,
        'totalCourseSell': totalCourseSell,
        'courseRate': courseRate,
        'totalReview': totalReview,
        'totalHours': totalHours,
      };
}

List<CommonCardModel> courseCardList = [
  CommonCardModel(
    image: 'assets/digital_marketing.jpg',
    subject: 'Digital Marketing',
    totalleacture: '12',
    days: '3',
    price: '\$200.00',
    totalCourseSell: '20+',
    courseRate: '4.1',
    totalReview: '7 Reviews',
    totalHours: '4',
  ),
  CommonCardModel(
    image: 'assets/graphics_design.jpg',
    subject: 'Graphics Design',
    totalleacture: '15',
    days: '3',
    price: '\$120.00',
    totalCourseSell: '12+',
    courseRate: '4.0',
    totalReview: '5 Reviews',
    totalHours: '4',
  ),
  CommonCardModel(
    image: 'assets/c.jpg',
    subject: 'C Language',
    totalleacture: '40',
    days: '2',
    price: '\$150.00',
    totalCourseSell: '10+',
    courseRate: '4.2',
    totalReview: '10 Reviews',
    totalHours: '3',
  ),
  CommonCardModel(
    image: 'assets/c++.jpg',
    subject: 'C++ Language',
    totalleacture: '40',
    days: '2',
    price: '\$150.00',
    totalCourseSell: '7+',
    courseRate: '3.8',
    totalReview: '8 Reviews',
    totalHours: '3',
  ),
  CommonCardModel(
    image: 'assets/web_design.jpg',
    subject: 'Web Designing',
    totalleacture: '22',
    days: '1',
    price: '\$250.00',
    totalCourseSell: '15+',
    courseRate: '4.2',
    totalReview: '14 Reviews',
    totalHours: '3.5',
  ),
  CommonCardModel(
    image: 'assets/python.jpg',
    subject: 'Python Language',
    totalleacture: '35',
    days: '1',
    price: '\$250.00',
    totalCourseSell: '12+',
    courseRate: '3.7',
    totalReview: '9 Reviews',
    totalHours: '3.5',
  ),
];
