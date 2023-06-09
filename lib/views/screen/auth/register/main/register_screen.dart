import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/slide_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/views/screen/auth/register/account_verification/account_verification.dart';
import 'package:staredu/views/screen/auth/register/register_screen_view_model.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Lengkap tidak boleh kosong';
    } else if (value.length < 3) {
      return 'Nama Lengkap minimal 3 karakter';
    } else if (value.contains(RegExp(r'^(?=.*?[0-9])'))) {
      return 'Nama Lengkap tidak boleh mengandung angka';
    } else if (value.contains(RegExp(r'^(?=.*?[!@#\-$_&+*~])'))) {
      return 'Nama Lengkap tidak boleh mengandung karakter spesial';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!value.contains('@')) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Nomor Handphone tidak boleh kosong';
    } else if (value.length < 10) {
      return 'Nomor Handphone minimal 10 karakter';
    } else if (!value.startsWith('0')) {
      return 'Nomor Handphone harus diawali dengan 0';
    }
    return null;
  }

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

  String? validateConfirmPassword(String value) {
    if (value != _passwordController.text) {
      return 'Kata Sandi Dan Konfirmasi Kata Sandi Tidak Sama';
    } else if (value.isEmpty) {
      return 'Konfirmasi Kata Sandi tidak boleh kosong';
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('Daftar Akun'),
      ),
      body: Stack(children: [
        SingleChildScrollView(
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
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor),
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
                              Expanded(
                                child: SizedBox(
                                  height: 5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    color: primaryColor,
                                  ),
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
                                validator: (value) => validateName(value!),
                                keyboardType: TextInputType.visiblePassword,
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
                                      borderSide: const BorderSide(width: 1)),
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
                                validator: (value) => validateEmail(value!),
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
                                      borderSide: const BorderSide(width: 1)),
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
                                validator: (value) => validatePhone(value!),
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
                                      borderSide: const BorderSide(width: 1)),
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
                                validator: (value) => validatePassword(value!),
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
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Konfirmasi Kata Sandi",
                                  style: GoogleFonts.poppins(
                                      color: blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                obscureText: _obscureTextConfirm,
                                controller: _confirmPasswordController,
                                validator: (value) =>
                                    validateConfirmPassword(value!),
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
                                        _obscureTextConfirm =
                                            !_obscureTextConfirm;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  counterText: "",
                                  labelText: "Konfirmasi Kata Sandi",
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
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return lightBlueColor;
                                    }
                                    return primaryColor;
                                  },
                                ),
                              ),
                              onPressed: () async {
                                if (_formkey.currentState!.validate() &&
                                    _passwordController.text ==
                                        _confirmPasswordController.text) {
                                  Provider.of<RegisterViewModel>(context,
                                          listen: false)
                                      .setStateRegister(MyState.loading);
                                  String message =
                                      await Provider.of<RegisterViewModel>(
                                              context,
                                              listen: false)
                                          .register(
                                              _nameController.text,
                                              _emailController.text,
                                              _phoneController.text,
                                              _passwordController.text);
                                  if (message.contains('success')) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        SlideAnimation(
                                            page: const AccountVerification(),
                                            arguments: _emailController.text));
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    AnimatedSnackBar.material(
                                            'Email Sudah Terdaftar / $message',
                                            type: AnimatedSnackBarType.error,
                                            snackBarStrategy:
                                                RemoveSnackBarStrategy())
                                        .show(context);
                                  }
                                } else {
                                  // ignore: use_build_context_synchronously
                                  AnimatedSnackBar.material(
                                          'Pastikan Semua Data Terisi Dengan Benar',
                                          type: AnimatedSnackBarType.info,
                                          snackBarStrategy:
                                              RemoveSnackBarStrategy())
                                      .show(context);
                                }
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
                                  Navigator.pushReplacement(
                                      context,
                                      SlideAnimation(
                                          page: const LoginScreen()));
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
        Consumer<RegisterViewModel>(
          builder: (context, value, child) =>
              value.stateRegister == MyState.loading
                  ? const OpacityProgressComponent()
                  : const SizedBox.shrink(),
        ),
        Consumer<RegisterViewModel>(
          builder: (context, value, child) =>
              value.stateRegister == MyState.loading
                  ? const CircularProgressComponent()
                  : const SizedBox.shrink(),
        )
      ]),
    );
  }
}
