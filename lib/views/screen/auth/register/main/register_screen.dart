import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('Daftar Akun'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
              width: double.infinity,
              child: Container(color: primaryColor),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Container(
                color: primaryColor,
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Selamat Datang',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: whiteColor,
                              fontWeight: FontWeight.w600))),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Yuk, isi formulir registrasi dibawah ini',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: whiteColor,
                            fontWeight: FontWeight.w400)),
                  )
                ]),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: whiteColor),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 5,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Container(
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Container(
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama Lengkap",
                                style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              maxLength: 28,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Nama Lengkap",
                                labelStyle: GoogleFonts.poppins(
                                  color: blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
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
                            Text("Email",
                                style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
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
                                color: blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Email",
                                labelStyle: GoogleFonts.poppins(
                                  color: blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
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
                            Text("Nomor Handphone",
                                style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              maxLength: 28,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Nomor Handphone",
                                labelStyle: GoogleFonts.poppins(
                                  color: blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
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
                            Text("Username",
                                style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.text,
                              maxLength: 28,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Username",
                                labelStyle: GoogleFonts.poppins(
                                  color: blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
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
                                    color: blackColor,
                                    fontSize: 12,
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
                                color: blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
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
                                labelText: "Kata Sandi",
                                labelStyle: GoogleFonts.poppins(
                                  color: blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
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
                        const SizedBox(
                          height: 30,
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
                            child: Text("Lanjut",
                                style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Kamu udah punya akun?",
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, SignUpScreen.routeName, (route) => false);
                              },
                              child: Text(
                                "  Masuk",
                                style: GoogleFonts.poppins(
                                  color: blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
