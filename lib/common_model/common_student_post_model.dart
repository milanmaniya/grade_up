class StudentPost {
  String image;
  String subject;
  String totalDays;
  String className;
  String location;
  String studentName;
  String message;
  String id;

  StudentPost({
    required this.image,
    required this.subject,
    required this.totalDays,
    required this.className,
    required this.location,
    required this.studentName,
    required this.message,
    required this.id,
  });

  factory StudentPost.fromJson(Map<String, dynamic> json) => StudentPost(
        image: json["image"],
        subject: json["subject"],
        totalDays: json["totalDays"],
        className: json["className"],
        location: json["location"],
        studentName: json["studentName"],
        message: json["message"],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "subject": subject,
        "totalDays": totalDays,
        "className": className,
        "location": location,
        "studentName": studentName,
        "message": message,
        "id": id,
      };
}

List<StudentPost> studentPostList = [
  StudentPost(
    image: 'assets/student_1.jpg',
    subject: 'Marketing',
    totalDays: '4 Days',
    className: '10-12',
    location: 'Surat, India',
    studentName: 'Asadul',
    message: 'I Need A Good Teacher',
    id: "0",
  ),
  StudentPost(
    image: 'assets/student_2.jpg',
    subject: 'Graphics',
    totalDays: '5 Days',
    className: '12',
    location: 'Vadodara, India',
    studentName: 'Jacob',
    message: 'Need A Good Teacher',
    id: "1",
  ),
  StudentPost(
    image: 'assets/student_3.jpg',
    subject: 'C Language',
    totalDays: '5 Days',
    className: '9-10',
    location: 'Mumbai, India',
    studentName: 'Albert',
    message: 'I Need A Good Teacher',
    id: "2",
  ),
  StudentPost(
    image: 'assets/student_4.jpg',
    subject: 'C++ ',
    totalDays: '4 Days',
    className: '10-12',
    location: 'Surat, India',
    studentName: 'Kristin',
    message: 'I Need A Good Teacher',
    id: "3",
  ),
  StudentPost(
    image: 'assets/stundet_5.jpg',
    subject: 'Web Design',
    totalDays: '4 Days',
    className: '12+',
    location: 'Pune, India',
    studentName: 'Floyd',
    message: 'I Need A Good Teacher',
    id: "4",
  ),
  StudentPost(
    image: 'assets/student_6.jpg',
    subject: 'Python',
    totalDays: '5 Days',
    className: '10+',
    location: 'Chennai, India',
    studentName: 'Ralph',
    message: 'I Need A Good Teacher',
    id: "5",
  ),
];
