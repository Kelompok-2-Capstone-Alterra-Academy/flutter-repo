import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/auth/forgot_password/forgot_password_view_model.dart';
import 'package:staredu/views/screen/auth/forgot_password/reset_password/reset_password.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static String routeName = '/otp_password';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final FocusNode _otpFocus1 = FocusNode();
  final FocusNode _otpFocus2 = FocusNode();
  final FocusNode _otpFocus3 = FocusNode();
  final FocusNode _otpFocus4 = FocusNode();

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
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    _otpController4.dispose();
    _otpFocus1.dispose();
    _otpFocus2.dispose();
    _otpFocus3.dispose();
    _otpFocus4.dispose();
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

  String? validateOtp(value) {
    if (value.isEmpty) {
      return "Kode OTP tidak boleh kosong";
    }
    if (value.length > 1) {
      return "Kode OTP tidak boleh lebih dari 1 digit";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Verifikasi OTP',
            style: GoogleFonts.poppins(
                fontSize: 18, color: blackColor, fontWeight: FontWeight.w600)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                                  maxLength: 1,
                                  focusNode: _otpFocus1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context)
                                          .requestFocus(_otpFocus2);
                                    }
                                  },
                                  buildCounter: (BuildContext context,
                                          {int? currentLength,
                                          int? maxLength,
                                          bool? isFocused}) =>
                                      null,
                                  controller: _otpController1,
                                  validator: (value) => validateOtp(value),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(
                                        color: blackColor,
                                        fontWeight: FontWeight.w700),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: TextFormField(
                                  maxLength: 1,
                                  focusNode: _otpFocus2,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context)
                                          .requestFocus(_otpFocus3);
                                    }
                                  },
                                  buildCounter: (BuildContext context,
                                          {int? currentLength,
                                          int? maxLength,
                                          bool? isFocused}) =>
                                      null,
                                  controller: _otpController2,
                                  validator: (value) => validateOtp(value),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(
                                        color: blackColor,
                                        fontWeight: FontWeight.w700),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: TextFormField(
                                  maxLength: 1,
                                  focusNode: _otpFocus3,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context)
                                          .requestFocus(_otpFocus4);
                                    }
                                  },
                                  buildCounter: (BuildContext context,
                                          {int? currentLength,
                                          int? maxLength,
                                          bool? isFocused}) =>
                                      null,
                                  controller: _otpController3,
                                  validator: (value) => validateOtp(value),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(
                                        color: blackColor,
                                        fontWeight: FontWeight.w700),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: TextFormField(
                                  maxLength: 1,
                                  focusNode: _otpFocus4,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      _otpFocus4.unfocus();
                                    }
                                  },
                                  buildCounter: (BuildContext context,
                                          {int? currentLength,
                                          int? maxLength,
                                          bool? isFocused}) =>
                                      null,
                                  controller: _otpController4,
                                  validator: (value) => validateOtp(value),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(
                                        color: blackColor,
                                        fontWeight: FontWeight.w700),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                  ),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              Provider.of<ForgotPasswordViewModel>(context,
                                      listen: false)
                                  .setStateOtp(MyState.loading);
                              String message =
                                  await Provider.of<ForgotPasswordViewModel>(
                                          context,
                                          listen: false)
                                      .verifyOtp(
                                          email,
                                          _otpController1.text +
                                              _otpController2.text +
                                              _otpController3.text +
                                              _otpController4.text);
                              if (message.contains('success')) {
                                // ignore: use_build_context_synchronously
                                dynamic args = {
                                  'token': message.split(' ')[1],
                                  'otp': _otpController1.text +
                                      _otpController2.text +
                                      _otpController3.text +
                                      _otpController4.text
                                };
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    FadeAnimation(
                                        page: const ResetPasswordScreen(),
                                        arguments: args));
                              } else {
                                _otpController1.clear();
                                _otpController2.clear();
                                _otpController3.clear();
                                _otpController4.clear();
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(message),
                                ));
                              }
                            }
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
          Consumer<ForgotPasswordViewModel>(
            builder: (context, value, child) =>
                value.stateOtp == MyState.loading
                    ? const OpacityProgressComponent()
                    : const SizedBox.shrink(),
          ),
          Consumer<ForgotPasswordViewModel>(
            builder: (context, value, child) =>
                value.stateOtp == MyState.loading
                    ? const CircularProgressComponent()
                    : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
