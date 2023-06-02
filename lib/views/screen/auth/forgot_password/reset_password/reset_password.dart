import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/auth/forgot_password/forgot_password_view_model.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static String routeName = '/reset_password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureTextPass = true;
  bool _obscureTextConfirmPass = true;

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Kata Sandi tidak boleh kosong';
    } else if (value.length < 6) {
      return 'Kata Sandi minimal 6 karakter';
    } else if (!value.contains(RegExp(r'^(?=.*?[A-Z])'))) {
      return 'Kata Sandi harus mengandung 1 huruf besar';
    } else if (!value.contains(RegExp(r'^(?=.*?[a-z])'))) {
      return 'Kata Sandi harus mengandung 1 huruf kecil';
    } else if (!value.contains(RegExp(r'^(?=.*?[0-9])'))) {
      return 'Kata Sandi harus mengandung 1 angka';
    } else if (!value.contains(RegExp(r'^(?=.*?[!@#\$&*~])'))) {
      return 'Kata Sandi harus mengandung 1 karakter spesial';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Lupa Kata Sandi',
            style: GoogleFonts.poppins(
                fontSize: 18, color: blackColor, fontWeight: FontWeight.w600)),
      ),
      body: Stack(
        children: [SingleChildScrollView(
          child: Container(
              color: whiteColor,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 250,
                          child: Image.asset(
                            "assets/images/reset_password.jpg",
                            width: 200,
                            height: 400,
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Buat Kata Sandi Baru',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: blackColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kata Sandi Baru",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            obscureText: _obscureTextPass,
                            controller: _passwordController,
                            validator: (value) => validatePassword(value!),
                            maxLength: 20,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w400),
                            cursorColor: const Color(0xff00c2cb),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_sharp),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureTextPass = !_obscureTextPass;
                                  });
                                },
                                child: Icon(
                                  _obscureTextPass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              counterText: "",
                              hintText: "Kata Sandi Baru",
                              labelStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: blackColor.withOpacity(0.4),
                                  fontWeight: FontWeight.w400),
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: whiteColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 1,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ulangi Kata Sandi",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w700,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            obscureText: _obscureTextConfirmPass,
                            controller: _confirmPasswordController,
                            validator: (value) => validatePassword(value!),
                            maxLength: 20,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w400),
                            cursorColor: const Color(0xff00c2cb),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_sharp),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureTextConfirmPass =
                                        !_obscureTextConfirmPass;
                                  });
                                },
                                child: Icon(
                                  _obscureTextConfirmPass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              counterText: "",
                              labelText: "Ulangi Kata Sandi",
                              labelStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: blackColor.withOpacity(0.4),
                                  fontWeight: FontWeight.w400),
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: whiteColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 1,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 150,
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
                            if (_formkey.currentState!.validate() && _passwordController.text == _confirmPasswordController.text) {
                              Provider.of<ForgotPasswordViewModel>(context,
                                      listen: false)
                                  .setStateResetPassword(MyState.loading);
                              String message =
                                  await Provider.of<ForgotPasswordViewModel>(
                                          context,
                                          listen: false)
                                      .resetPassword(
                                          token,
                                          _passwordController.text,);
                              if (message.contains('success')) {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: SizedBox(
                                        height: 200,
                                        child: Image.asset(
                                          'assets/images/alert_reset_password.jpg',
                                          width: 100,
                                          height: 120,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 80,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Text('Sukses Ganti Kata Sandi',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              textAlign: TextAlign.center,
                                              'Kata Sandi akunmu telah diperbaharui, silahkan untuk masuk kembali',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: blackColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      actions: [
                                        SizedBox(
                                          height: 40,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith<Color?>(
                                                (Set<MaterialState> states) {
                                                  if (states.contains(
                                                      MaterialState.pressed)) {
                                                    return lightBlueColor;
                                                  }
                                                  return primaryColor;
                                                },
                                              ),
                                            ),
                                            onPressed: ()  {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                FadeAnimation(
                                                    page: const LoginScreen()),
                                                (Route<dynamic> route) =>
                                                    false,
                                              );
                                            },
                                            child: Text(
                                              "Masuk",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(message),
                                ));
                              }
                              }
                          },
                          child: Text(
                            "Lanjutkan",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        Consumer<ForgotPasswordViewModel>(
            builder: (context, value, child) =>
                value.stateResetPassword == MyState.loading
                    ? const OpacityProgressComponent()
                    : const SizedBox.shrink(),
          ),
          Consumer<ForgotPasswordViewModel>(
            builder: (context, value, child) =>
                value.stateResetPassword == MyState.loading
                    ? const CircularProgressComponent()
                    : const SizedBox.shrink(),
          )
        ]
      ),
    );
  }
}
