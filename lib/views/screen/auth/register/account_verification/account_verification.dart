import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class AccountVerification extends StatefulWidget {
  const AccountVerification({super.key});
  static String routeName = '/account_verification';

  @override
  State<AccountVerification> createState() => _AccountVerificationState();
}

class _AccountVerificationState extends State<AccountVerification> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int _start = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
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
        title: Text('Verifikasi Akun',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Verifikasi Email mu',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: blackColor,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Kode OTP dikirim lewat email ',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: blackColor,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'agnescherrly@contoh.com',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text:
                                    ', cek dan masukin kode OTP di form bawah,',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
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
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: blackColor,
                                    fontWeight: FontWeight.w700),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 0),
                                ),
                                focusedBorder: OutlineInputBorder(
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
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 18,
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
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 18,
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
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 18,
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
                  _start == 0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Kirim ulang kode OTP?',
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.start,
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _start = 60;
                                    startTimer();
                                  });
                                },
                                child: Text(
                                  'Kirim',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _start == 0
                                  ? 'Kirim ulang kode OTP'
                                  : 'Kode OTP akan kadaluarsa dalam $_start detik',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: blackColor,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 70,
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
                      child: Text("Verifikasi Akun",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
