class TeacherCard {
  String image;
  String subject;
  String teacherName;
  String experience;
  String rate;
  String review;
  String id;

  TeacherCard({
    required this.image,
    required this.subject,
    required this.teacherName,
    required this.experience,
    required this.rate,
    required this.review,
    required this.id,
  });

  factory TeacherCard.fromJson(Map<String, dynamic> json) => TeacherCard(
        image: json["image"],
        subject: json["subject"],
        teacherName: json["teacherName"],
        experience: json["experience"],
        rate: json["rate"],
        review: json["review"],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "subject": subject,
        "teacherName": teacherName,
        "experience": experience,
        "rate": rate,
        "review": review,
        "id": id,
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
    id: '0',
  ),
  TeacherCard(
    image: 'assets/prof_graphics.jpg',
    subject: 'Graphics Design',
    teacherName: 'Omar Faruk',
    experience: '3',
    rate: '4.0',
    review: '12',
    id: '1',
  ),
  TeacherCard(
    image: 'assets/prof_c.jpg',
    subject: 'C Language',
    teacherName: 'Ashan Habib',
    experience: '3',
    rate: '4.2',
    review: '16',
    id: '2',
  ),
  TeacherCard(
    image: 'assets/prof_cplus.jpg',
    subject: 'C++ Language',
    teacherName: 'Jahidul Islam',
    experience: '1',
    rate: '3.2',
    review: '6',
    id: '3',
  ),
  TeacherCard(
    image: 'assets/prof_web_desiging.jpg',
    subject: 'Web Designing',
    teacherName: 'Milan Maniya',
    experience: '2',
    rate: '4.5',
    review: '20',
    id: '4',
  ),
  TeacherCard(
    image: 'assets/prof_python.jpg',
    subject: 'Python Programming',
    teacherName: 'Harsh Sangani',
    experience: '4',
    rate: '4.1',
    review: '13',
    id: '5',
  )
];
