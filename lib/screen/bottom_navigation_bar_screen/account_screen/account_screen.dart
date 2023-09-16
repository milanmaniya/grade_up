import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_widget/common_text.dart';
import 'package:grade_up/extension/media_query_extension.dart';
import 'package:grade_up/firebase_api/firebase_api.dart';
import 'package:grade_up/screen/login_screen/login_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late Future<List<Map>> futureUserData;

  String key = '';

  @override
  void initState() {
    futureUserData = FirebaseApi.selectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 70),
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 18,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Account',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 140,
                width: 140,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/prof_cplus.jpg'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: futureUserData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                key = snapshot.data![0]['key'];

                return Container(
                  width: context.screenWidth * 0.9,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(data: "Student Name", size: 17),
                          commonText(data: "Mobile No", size: 17),
                          commonText(data: "Email", size: 17),
                          commonText(data: "Age", size: 17),
                          commonText(data: "Gender", size: 17),
                          commonText(data: "Address", size: 17),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(
                              data: ":- ${snapshot.data![0]['userName']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['mobNum']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['email']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['age']}", size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['gender']}",
                              size: 17),
                          commonText(
                              data: ":- ${snapshot.data![0]['address']}",
                              size: 17),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  width: context.screenWidth * 0.9,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(data: "Student Name", size: 17),
                          commonText(data: "Mobile No", size: 17),
                          commonText(data: "Email", size: 17),
                          commonText(data: "Age", size: 17),
                          commonText(data: "Gender", size: 17),
                          commonText(data: "Address", size: 17),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(data: ":- profile Name", size: 17),
                          commonText(data: ":- Mobile No", size: 17),
                          commonText(data: ":- Email", size: 17),
                          commonText(data: ":- Age", size: 17),
                          commonText(data: ":- Gender", size: 17),
                          commonText(data: ":- Adress", size: 17),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                minimumSize: MaterialStateProperty.all(
                  Size(context.screenWidth, 55),
                ),
              ),
              onPressed: () {
                FirebaseApi.removeData(key: key);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                'Logout',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
