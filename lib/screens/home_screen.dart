import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_attendance/services/attendance_service.dart';
import 'package:pkl_attendance/widgets/loading.dart';
import 'package:pkl_attendance/widgets/message/errorMessage.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController rfidController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Row(children: [
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFFE8F4FF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/attendance.png',
                    width: 760,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 100),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Image.asset(
                          'assets/images/hummatech.png',
                          height: 60,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 120),
                        child: Text(
                          "Copyright By Hummatech",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xFF00A7EF),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Selamat Datang",
                          style: GoogleFonts.poppins(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tab Kartu anda untuk absen hari ini",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        autofocus: true,
                        controller: rfidController,
                        onEditingComplete: () {
                          showLoading();
                          AttendanceService()
                              .postAttendance(rfidController.text)
                              .then((value) {
                            stopLoading();
                            if (value.code == 200) {
                              showErrorMessage(value.message.toString());
                              rfidController.clear();
                            } else {
                              rfidController.clear();
                              showErrorMessage(value.message.toString());
                            }
                          });
                        },
                        cursorColor: const Color(0xFFEEEEEE),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  "${DateTime.now().year} Hummatech All Rights Reseresed",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF525252)),
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
