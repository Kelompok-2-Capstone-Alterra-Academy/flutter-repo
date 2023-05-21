
import 'package:flutter/material.dart';
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
                child: Column(children: const [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Selamat Datang',
                          style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17))),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Yuk, isi formulir registrasi dibawah ini',
                        style: TextStyle(color: whiteColor)),
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
                            const Text(
                              "Nama Lengkap",
                              style: TextStyle(
                                  color: Color(0xff363d4a),
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              maxLength: 28,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Nama Lengkap",
                                labelStyle: TextStyle(
                                    color: blackColor.withOpacity(0.4)),
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
                            const Text(
                              "Email",
                              style: TextStyle(
                                  color: Color(0xff363d4a),
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
                              style: const TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    color: blackColor.withOpacity(0.4)),
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
                            const Text(
                              "Nomor Handphone",
                              style: TextStyle(
                                  color: Color(0xff363d4a),
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              maxLength: 28,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Nomor Handphone",
                                labelStyle: TextStyle(
                                    color: blackColor.withOpacity(0.4)),
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
                            const Text(
                              "Username",
                              style: TextStyle(
                                  color: Color(0xff363d4a),
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.text,
                              maxLength: 28,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: const Color(0xff00c2cb),
                              decoration: InputDecoration(
                                counterText: "",
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    color: blackColor.withOpacity(0.4)),
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
                            const Text(
                              "Kata Sandi",
                              style: TextStyle(
                                  color: Color(0xff363d4a),
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              obscureText: _obscureText,
                              controller: _passwordController,
                              maxLength: 20,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                color: blackColor,
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
                                labelStyle: TextStyle(
                                    color: blackColor.withOpacity(0.4)),
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
                            child: const Text(
                              "Lanjut",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Kamu udah punya akun?",
                                style:
                                    TextStyle(color: blackColor, fontSize: 14)),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, SignUpScreen.routeName, (route) => false);
                              },
                              child: const Text(
                                "  Masuk",
                                style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
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
