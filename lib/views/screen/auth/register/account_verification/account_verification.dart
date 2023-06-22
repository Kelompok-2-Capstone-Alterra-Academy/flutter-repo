import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/auth/register/register_screen_view_model.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

class AccountVerification extends StatefulWidget {
  const AccountVerification({super.key});
  static String routeName = '/account_verification';

  @override
  State<AccountVerification> createState() => _AccountVerificationState();
}

class _AccountVerificationState extends State<AccountVerification> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late PreferencesUtils preferencesUtils;
  int _start = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    init();
    startTimer();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    _otpController4.dispose();
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

  saveToken(String value) async {
    String token = value.split(' ')[1];
    preferencesUtils.savePreferencesString('token', token);
    preferencesUtils.savePreferencesBool('isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Verifikasi Akun',
            style: GoogleFonts.poppins(
                fontSize: 18, color: blackColor, fontWeight: FontWeight.w600)),
      ),
      body: Stack(children: [
        SingleChildScrollView(
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
                                  text: email,
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
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                buildCounter: (BuildContext context,
                                        {int? currentLength,
                                        int? maxLength,
                                        bool? isFocused}) =>
                                    null,
                                controller: _otpController1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w700),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) => validateOtp(value),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                buildCounter: (BuildContext context,
                                        {int? currentLength,
                                        int? maxLength,
                                        bool? isFocused}) =>
                                    null,
                                controller: _otpController2,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w700),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) => validateOtp(value),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                buildCounter: (BuildContext context,
                                        {int? currentLength,
                                        int? maxLength,
                                        bool? isFocused}) =>
                                    null,
                                controller: _otpController3,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w700),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) => validateOtp(value),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _otpController4,
                                maxLength: 1,
                                buildCounter: (BuildContext context,
                                        {int? currentLength,
                                        int? maxLength,
                                        bool? isFocused}) =>
                                    null,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w700),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) => validateOtp(value),
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
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            Provider.of<RegisterViewModel>(context,
                                    listen: false)
                                .setStateOtp(MyState.loading);
                            String message =
                                await Provider.of<RegisterViewModel>(context,
                                        listen: false)
                                    .verifyOtp(
                                        email,
                                        _otpController1.text +
                                            _otpController2.text +
                                            _otpController3.text +
                                            _otpController4.text);
                            if (message.contains('success')) {
                              await saveToken(message);
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  FadeAnimation(page: const HomeScreen()),
                                  (route) => false);
                            } else {
                              // ignore: use_build_context_synchronously
                              // clear all controller
                              _otpController1.clear();
                              _otpController2.clear();
                              _otpController3.clear();
                              _otpController4.clear();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Wrong or $message"),
                              ));
                            }
                          }
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
        Consumer<RegisterViewModel>(
          builder: (context, value, child) => value.stateOtp == MyState.loading
              ? const OpacityProgressComponent()
              : const SizedBox.shrink(),
        ),
        Consumer<RegisterViewModel>(
          builder: (context, value, child) => value.stateOtp == MyState.loading
              ? const CircularProgressComponent()
              : const SizedBox.shrink(),
        )
      ]),
    );
  }
}
