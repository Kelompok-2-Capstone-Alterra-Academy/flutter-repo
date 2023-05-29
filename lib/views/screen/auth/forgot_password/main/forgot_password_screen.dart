import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static String routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Lupa Kata Sandi',
            style: GoogleFonts.poppins(
                fontSize: 16, color: blackColor, fontWeight: FontWeight.w600)),
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
                          "assets/images/forgot_password.jpg",
                          width: 200,
                          height: 400,
                        )),
                    Text(
                        'Jangan khawatir! Masukkan alamat email yang terkait dengan akun Anda',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: blackColor,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w600)),
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
                              fontSize: 14,
                              color: blackColor,
                              fontWeight: FontWeight.w400),
                          cursorColor: const Color(0xff00c2cb),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_sharp,
                            ),
                            counterText: "",
                            labelText: "Email",
                            labelStyle: GoogleFonts.poppins(
                                color: blackColor.withOpacity(0.4),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: whiteColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 1)),
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
                          if (_formkey.currentState!.validate()) {}
                        },
                        child: Text(
                          "Kirim OTP",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: whiteColor,
                              fontWeight: FontWeight.w600),
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
