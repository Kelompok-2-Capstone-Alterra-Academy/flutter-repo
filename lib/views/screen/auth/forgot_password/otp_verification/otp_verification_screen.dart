import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static String routeName = '/otp_password';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int _start = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        timer.cancel();
        // Timer completed, do something
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Verifikasi OTP',
            style: GoogleFonts.poppins(
                fontSize: 18, color: blackColor, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: whiteColor,
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/images/forgot_password.jpg",
                        width: 200,
                        height: 400,
                      )),
                  Text(
                    'Kami telah mengirimkan kode OTP ke email Anda',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontWeight: FontWeight.w700),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Kode OTP tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontWeight: FontWeight.w700),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Kode OTP tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontWeight: FontWeight.w700),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Kode OTP tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontWeight: FontWeight.w700),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Kode OTP tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Kode OTP akan kadaluarsa dalam $_start detik',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return lightBlueColor;
                            }
                            return primaryColor;
                          },
                        ),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {}
                      },
                      child: Text("Lanjutkan",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: whiteColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
