import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/animation/slide_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/auth/login/login_view_model.dart';
import 'package:staredu/views/screen/auth/register/main/register_screen.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/widgets/button/button_full.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  late PreferencesUtils preferencesUtils;

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!value.contains('@')) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Kata Sandi tidak boleh kosong';
    }
    return null;
  }

  savePassword(String value) async {
    preferencesUtils.savePreferencesString('password', value);
  }

  saveToken(String value) async {
    preferencesUtils.savePreferencesString('token', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          centerTitle: true,
          elevation: 0,
          title: Image.asset(
            "assets/images/logo.jpg",
          ),
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Container(
              color: whiteColor,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/images/login_logo.jpg",
                        width: 200,
                        height: 400,
                      )),
                  Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Masuk ke Akun",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: blackColor,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: blackColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: ((value) => validateEmail(value!)),
                              keyboardType: TextInputType.emailAddress,
                              maxLength: 28,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email_sharp,
                                ),
                                counterText: "",
                                hintText: "Email",
                                labelStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: blackColor.withOpacity(0.4),
                                    fontWeight: FontWeight.w400),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                fillColor: whiteColor,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(width: 1)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Kata Sandi",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: blackColor,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              obscureText: _obscureText,
                              validator: ((value) => validatePassword(value!)),
                              controller: _passwordController,
                              maxLength: 20,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: blackColor.withOpacity(0.4),
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_sharp),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                counterText: "",
                                hintText: "Kata Sandi",
                                labelStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: blackColor.withOpacity(0.4),
                                    fontWeight: FontWeight.w400),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                  activeColor: primaryColor,
                                ),
                                Text("Ingat saya",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: blackColor,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Lupa Kata Sandi?",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: blackColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
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
                                Provider.of<LoginViewModel>(context,
                                        listen: false)
                                    .setState(MyState.loading);
                                String message =
                                    await Provider.of<LoginViewModel>(context,
                                            listen: false)
                                        .login(_emailController.text,
                                            _passwordController.text);
                                if (message.contains('success')) {
                                  await saveToken(message);
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.looks_sharp,
                                                  color: blackColor,
                                                  size: 50,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "Simpan Kata Sandi?",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "Simpan Kata Sandi ini agar dapat diisikan kembali secara otomatis saat masuk berikutnya",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                ButtonFull(
                                                    title: 'masuk',
                                                    color: primaryColor,
                                                    textColor: whiteColor,
                                                    press: () async {
                                                      await savePassword(
                                                          _passwordController
                                                              .text);
                                                      Navigator.push(
                                                          context,
                                                          FadeAnimation(
                                                              page:
                                                                  const HomeScreen()));
                                                    }),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ButtonFull(
                                                    title: 'Lain Kali',
                                                    color: whiteColor,
                                                    textColor: primaryColor,
                                                    borderColor: primaryColor,
                                                    press: () {
                                                      Navigator.push(
                                                          context,
                                                          FadeAnimation(
                                                              page:
                                                                  const HomeScreen()));
                                                    })
                                              ],
                                            ),
                                          ),
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
                            child: Text("Masuk",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Belum Punya Akun?",
                                style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                            GestureDetector(
                              onTap: () {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    SlideAnimation(
                                        page: const RegisterScreen()));
                              },
                              child: Text("  Daftar",
                                  style: GoogleFonts.poppins(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<LoginViewModel>(
            builder: (context, value, child) => value.state == MyState.loading
                ? const OpacityProgressComponent()
                : const SizedBox.shrink(),
          ),
          Consumer<LoginViewModel>(
            builder: (context, value, child) => value.state == MyState.loading
                ? const CircularProgressComponent()
                : const SizedBox.shrink(),
          )
        ]));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    String? email = preferencesUtils.getPreferencesString('email');
    String? password = preferencesUtils.getPreferencesString('password');
    if (email != null) {
      _emailController.text = email;
    }
    if (password != null) {
      _passwordController.text = password;
    }
  }
}
