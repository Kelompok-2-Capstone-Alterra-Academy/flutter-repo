import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Lupa Kata Sandi',
            style: GoogleFonts.poppins(
                fontSize: 18, color: blackColor, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
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
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
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
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, LoginScreen.routeName);
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
    );
  }
}
