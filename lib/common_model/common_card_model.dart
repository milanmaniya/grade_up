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
  List<String> videoPlayerList;

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
    required this.videoPlayerList,
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
        videoPlayerList: json['videoPlayerList'],
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
    totalReview: '7 Review',
    totalHours: '4',
    videoPlayerList: [
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
      'UVAyIh5V4NY',
    ],
  ),
  CommonCardModel(
    image: 'assets/graphics_design.jpg',
    subject: 'Graphics Design',
    totalleacture: '15',
    days: '3',
    price: '\$120.00',
    totalCourseSell: '12+',
    courseRate: '4.0',
    totalReview: '5 Review',
    totalHours: '4',
    videoPlayerList: [
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
      'qfOo3vuvAb8',
    ],
  ),
  CommonCardModel(
    image: 'assets/c.jpg',
    subject: 'C Language',
    totalleacture: '40',
    days: '2',
    price: '\$150.00',
    totalCourseSell: '10+',
    courseRate: '4.2',
    totalReview: '10 Review',
    totalHours: '3',
    videoPlayerList: [
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
      'U3aXWizDbQ4',
    ],
  ),
  CommonCardModel(
    image: 'assets/c++.jpg',
    subject: 'C++ Language',
    totalleacture: '40',
    days: '2',
    price: '\$150.00',
    totalCourseSell: '7+',
    courseRate: '3.8',
    totalReview: '8 Review',
    totalHours: '3',
    videoPlayerList: [
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
      'MNeX4EGtR5Y',
    ],
  ),
  CommonCardModel(
    image: 'assets/web_design.jpg',
    subject: 'Web Designing',
    totalleacture: '22',
    days: '1',
    price: '\$250.00',
    totalCourseSell: '15+',
    courseRate: '4.2',
    totalReview: '14 Review',
    totalHours: '3.5',
    videoPlayerList: [
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
      'EMTZUfIbiBk',
    ],
  ),
  CommonCardModel(
    image: 'assets/python.jpg',
    subject: 'Python Language',
    totalleacture: '35',
    days: '1',
    price: '\$250.00',
    totalCourseSell: '12+',
    courseRate: '3.7',
    totalReview: '9 Review',
    totalHours: '3.5',
    videoPlayerList: [
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
      'zZTUKhKpIew',
    ],
  ),
];
