import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/utils/state/my_state.dart';
import 'package:staredu/views/screen/edit_profile/edit_profile_view_model.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/widgets/loading/circular_progress.dart';
import 'package:staredu/widgets/loading/opacity_progress.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const routeName = '/edit-profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late PreferencesUtils preferencesUtils;
  String? token;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      token = preferencesUtils.getPreferencesString('token');
    });
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Lengkap tidak boleh kosong';
    } else if (value.length < 3) {
      return 'Nama Lengkap minimal 3 karakter';
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

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Alamat tidak boleh kosong';
    } else if (value.length < 5) {
      return 'Alamat minimal 5 karakter';
    }
    return null;
  }

  String? validateDate(String value) {
    if (value.isEmpty) {
      return 'Tanggal Lahir tidak boleh kosong';
    }
    return null;
  }

  String? validateGender(String value) {
    if (value.isEmpty) {
      return 'Jenis Kelamin tidak boleh kosong';
    }
    return null;
  }

  String? validateSchoolName(String value) {
    if (value.isEmpty) {
      return 'Nama Sekolah tidak boleh kosong';
    }
    return null;
  }

  String? validateMajor(String value) {
    if (value.isEmpty) {
      return 'Jurusan tidak boleh kosong';
    }
    return null;
  }

  String? validateClasses(String value) {
    if (value.isEmpty) {
      return 'Kelas tidak boleh kosong';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Edit Profil',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          )),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 130,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/default_mentor.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                // name
                                SizedBox(
                                  width: 250,
                                  child: TextFormField(
                                    controller: nameController
                                      ..text = user.name,
                                    validator: (value) => validateName(value!),
                                    keyboardType: TextInputType.text,
                                    autocorrect: false,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: greyColor,
                                      hintText: 'Nama Lengkap',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // email
                                SizedBox(
                                  width: 250,
                                  child: TextFormField(
                                    controller: emailController
                                      ..text = user.email,
                                    validator: (value) => validateEmail(value!),
                                    keyboardType: TextInputType.emailAddress,
                                    autocorrect: false,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: greyColor,
                                      hintText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: dateController..text = user.dob,
                      validator: (value) => validateDate(value!),
                      keyboardType: TextInputType.datetime,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_today_outlined),
                        ),
                        filled: true,
                        fillColor: greyColor,
                        hintText: 'Tanggal Lahir',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: addressController..text = user.city,
                      validator: (value) => validateAddress(value!),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: greyColor,
                        hintText: 'Kota Asal',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phoneController..text = user.phoneNumber,
                      validator: (value) => validatePhone(value!),
                      keyboardType: TextInputType.phone,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: greyColor,
                        hintText: 'Nomor Telepon',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //gender
                    TextFormField(
                      controller: genderController..text = user.gender,
                      validator: (value) => validateGender(value!),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.woman_outlined),
                        ),
                        filled: true,
                        fillColor: greyColor,
                        hintText: 'Jenis Kelamin',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // grade
                    TextFormField(
                      controller: gradeController..text = user.classes,
                      validator: (value) => validateClasses(value!),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.school_outlined),
                        ),
                        filled: true,
                        fillColor: greyColor,
                        hintText: 'Kelas',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: schoolNameController..text = user.schoolName,
                      validator: (value) => validateSchoolName(value!),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: greyColor,
                        hintText: 'Nama Sekolah',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: majorController..text = user.major,
                      validator: (value) => validateMajor(value!),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: greyColor,
                        hintText: 'Jurusan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                            // ignore: use_build_context_synchronously
                            User? updateUser =
                                await Provider.of<EditProfileViewModel>(context,
                                        listen: false)
                                    .updateUserDetail(user, token);
                            if (updateUser != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  FadeAnimation(page: const HomeScreen()),
                                  (route) => false);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Gagal mengubah data'),
                                ),
                              );
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Gagal mengubah data'),
                              ),
                            );
                          }
                        },
                        child: Text("Simpan Perubahan",
                            style: GoogleFonts.poppins(
                                color: whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Consumer<EditProfileViewModel>(
          builder: (context, value, child) => value.state == MyState.loading
              ? const OpacityProgressComponent()
              : const SizedBox.shrink(),
        ),
        Consumer<EditProfileViewModel>(
          builder: (context, value, child) => value.state == MyState.loading
              ? const CircularProgressComponent()
              : const SizedBox.shrink(),
        )
      ]),
    );
  }
}
