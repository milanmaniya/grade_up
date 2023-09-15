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
      'wViKLTl_HgQ&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=1',
      'rTbPuLeP5mo&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=2',
      'egOUkS26a64&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=3',
      '6z02pcgx9Pg&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=4',
      'OiNms2Muf-0&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=5',
      'b-bt6wzKU0I&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=6',
      'toZrqSyIFYA&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=7',
      'kod4vmPdm3E&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=8',
      'oZ5F4aknYFY&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=9',
      'Z7vUHTGP9pI&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=10',
      '7Yt_6OLxsH8&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=11',
      'bPAJQS4Qfv0&list=PLjVLYmrlmjGcCeELcp2VU66XHlmyoPRpM&index=12'
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
      'U9DDxPBtJNA&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH',
      'oyCbsrlIdR4&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=2',
      'GJjCmAhF-VY&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=3',
      'NT3f8qn0FwE&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=4',
      'Xh7Xp3CJ4Ik&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=5',
      'UkHLneqW3Ho&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=6',
      'gU2nF0rhJi4&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=7',
      'thdjsabtAeo&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=8',
      'hrCzD1gYF5o&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=9',
      'b2TK6NJ86x0&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=10',
      '0-xVtq1XgLM&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=11',
      'sljQkenTW3U&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=12',
      'knBWAjSVmak&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=13',
      'eSjnS0bHa9Y&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=14',
      'OhmkVs6-zdM&list=PLoAVEfDOSZBpkfTdRTAn9ivxOrmyO2liH&index=15'
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
      'kVIOEdrigWY&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb',
      'WclJri-15HI&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=2',
      '3cZcnsYEQow&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=3',
      'wARq2NWj6oM&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=4',
      'pCnUKyjp6iE&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=5',
      'XksiheECUN4&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=6',
      'e-lXCPCztHM&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=7',
      '-pNL5qB0-dc&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=8',
      'duT_rVN4BYE&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=9',
      'uK53ZhjqYng&list=PLmRclvVt5DtksgReOH3s7R1_cb1QA8vrb&index=10',
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
      'z9bZufPHFLU&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ',
      '0yn7irrHzM8&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=2',
      'cnT1oW5_ePM&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=3',
      '7dPdMtBX1d8&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=4',
      'cyB3HNlQyjY&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=5',
      'IlIn_D1RT7M&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=6',
      'Stf7KBiA1vs&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=7',
      'G80-j_xnE_8&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=8',
      'JBgZxnAj4hg&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=9',
      'LfgAOZ1kKMw&list=PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ&index=10'
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
      'l1EssrLxt7E&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n',
      'Rek0NWPCNOc&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=2',
      '2QR11oDukn4&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=3',
      'jRAZlTEZi9I&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=4',
      '61ppyY5rUB0&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=5',
      'sqJ6xZ9mUwE&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=6',
      '4nC4VXHlys8&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=7',
      'C01LeeMhwHc&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=8',
      'wKPlQkOdpFQ&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=9',
      '6Cpd63_WXdI&list=PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n&index=10'
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
      'OZIRAavoGng&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7',
      'fS1Lh5TwWN8&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=2',
      '18oZPfHYfeE&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=3',
      'MfGfMWsvgCc&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=4',
      'o-pRdr8IMWg&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=5',
      'ig3fRo9hlMo&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=6',
      'iyOVgQDkx1E&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=7',
      'rnK45SKWwVg&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=8',
      'Aamih6LtMNM&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=9',
      'TeCjHTYWNAw&list=PLjVLYmrlmjGcQfNj_SLlLV4Ytf39f8BF7&index=10'
    ],
  ),
];
