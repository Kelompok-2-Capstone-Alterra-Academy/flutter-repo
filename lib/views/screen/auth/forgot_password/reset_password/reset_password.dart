import 'package:flutter/material.dart';
import 'package:staredu/utils/color/color.dart';

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
        title:
            const Text('Lupa Kata Sandi', style: TextStyle(color: blackColor)),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: whiteColor,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/images/reset_password.jpg",
                        width: 200,
                        height: 400,
                      )),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Buat Kata Sandi Baru',
                      style: TextStyle(
                        fontSize: 20,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kata Sandi Baru",
                        style: TextStyle(
                            color: Color(0xff363d4a),
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
                        style: const TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                        ),
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
                          labelText: "Kata Sandi",
                          labelStyle:
                              TextStyle(color: blackColor.withOpacity(0.4)),
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
                      const Text(
                        "Konfirmasi Kata Sandi",
                        style: TextStyle(
                            color: Color(0xff363d4a),
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: _obscureTextConfirmPass,
                        controller: _confirmPasswordController,
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
                          labelText: "Kata Sandi",
                          labelStyle:
                              TextStyle(color: blackColor.withOpacity(0.4)),
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
                        if (_formkey.currentState!.validate()) {}
                      },
                      child: const Text(
                        "Lanjutkan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
