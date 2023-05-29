import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

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
        body: SingleChildScrollView(
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
                            onTap: () {
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context,
                              //     ForgotPasswordScreen.routeName,
                              //     (route) => false);
                            },
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
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {}
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
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context, SignUpScreen.routeName, (route) => false);
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
        ));
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
  }
}
