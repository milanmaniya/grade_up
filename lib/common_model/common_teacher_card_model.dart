class TeacherCard {
  String image;
  String subject;
  String teacherName;
  String experience;
  String rate;
  String review;

  TeacherCard({
    required this.image,
    required this.subject,
    required this.teacherName,
    required this.experience,
    required this.rate,
    required this.review,
  });

  factory TeacherCard.fromJson(Map<String, dynamic> json) => TeacherCard(
        image: json["image"],
        subject: json["subject"],
        teacherName: json["teacherName"],
        experience: json["experience"],
        rate: json["rate"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "subject": subject,
        "teacherName": teacherName,
        "experience": experience,
        "rate": rate,
        "review": review,
      };
}

List<TeacherCard> commonTeacherCardList = [
  TeacherCard(
    image: 'assets/prof_digital_marketing.jpg',
    subject: 'Digital Marketing',
    teacherName: 'Minhazul Abedin',
    experience: '2',
    rate: '3.8',
    review: '8',
  ),
  TeacherCard(
    image: 'assets/prof_graphics.jpg',
    subject: 'Graphics Design',
    teacherName: 'Omar Faruk',
    experience: '3',
    rate: '4.0',
    review: '12',
  ),
  TeacherCard(
    image: 'assets/prof_c.jpg',
    subject: 'C Language',
    teacherName: 'Ashan Habib',
    experience: '3',
    rate: '4.2',
    review: '16',
  ),
  TeacherCard(
    image: 'assets/prof_cplus.jpg',
    subject: 'C++ Language',
    teacherName: 'Jahidul Islam',
    experience: '1',
    rate: '3.2',
    review: '6',
  ),
  TeacherCard(
    image: 'assets/prof_web_desiging.jpg',
    subject: 'Web Designing',
    teacherName: 'Minhazul Abedin',
    experience: '2',
    rate: '4.5',
    review: '20',
  ),
  TeacherCard(
    image: 'assets/prof_python.jpg',
    subject: 'Python Programming',
    teacherName: 'Minhazul Abedin',
    experience: '4',
    rate: '4.1',
    review: '13',
  )
];
