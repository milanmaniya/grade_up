import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:grade_up/common_widget/common_toast.dart';
import 'package:grade_up/common_widget/common_value.dart';
import 'package:grade_up/screen/bottom_navigation_bar_screen/home_screen/tab_bar_screen/online_courses_screen/language_course_screen.dart/leacture_screen/leactures_screen.dart';
import 'package:grade_up/utils/constraint_data.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class LanguageCourseScreen extends StatefulWidget {
  const LanguageCourseScreen({super.key, required this.index});

  final int? index;

  @override
  State<LanguageCourseScreen> createState() => _LanguageCourseScreenState();
}

class _LanguageCourseScreenState extends State<LanguageCourseScreen> {
  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    // getValue();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  String? paymentId;

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var options = {
      'key': 'rzp_test_PPC0qcP98CxuXa',
      'amount': 100,
      'name': 'Grade Up',
      'description': courseCardList[widget.index!].subject,
      'prefill': {
        'contact': CommonValue.phNumberValue,
        'email': 'gradeup@razorpy.com'
      }
    };

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: ConstraintData.bgAppBarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          courseCardList[widget.index!].subject,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(courseCardList[widget.index!].image),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    courseCardList[widget.index!].subject,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    courseCardList[widget.index!].price,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '${courseCardList[widget.index!].days} Days Ago',
                    style: GoogleFonts.lato(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Course Sell  :',
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    courseCardList[widget.index!].totalCourseSell,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    courseCardList[widget.index!].courseRate,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '(${courseCardList[widget.index!].totalReview})',
                    style: GoogleFonts.lato(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Time: ${courseCardList[widget.index!].totalHours} Hours',
                          style: GoogleFonts.lato(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Life Time Access',
                          style: GoogleFonts.lato(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.edit_document,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Verified Sertification',
                          style: GoogleFonts.lato(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.language,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Language: Hindi',
                          style: GoogleFonts.lato(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                ),
                onPressed: paymentId == null
                    ? () {
                        _razorpay.open(options);
                        setState(() {});
                      }
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeactureScreen(
                              index: widget.index,
                            ),
                          ),
                        );
                        setState(() {});
                      },
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => LeactureScreen(
                //         index: widget.index,
                //       ),
                //     ),
                //   );
                // },
                child: Text(
                  paymentId == null ? 'Buy Course' : 'Leacture',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) async {
    paymentId = response.paymentId!;

    // SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setString('paymentId', response.paymentId!);

    log(paymentId!);
    CommonToast().showMessage(
        message: 'Payment successfully completed\n ${response.paymentId}');
    setState(() {});
  }

  _handlePaymentError(PaymentFailureResponse response) {
    CommonToast().showMessage(message: response.error.toString());
  }

  _handleExternalWallet(ExternalWalletResponse response) {
    log(response.walletName!);
  }

  // void getValue() async {
  //   SharedPreferences pre = await SharedPreferences.getInstance();
  //   paymentId = pre.getString('paymentId');
  // }
}
