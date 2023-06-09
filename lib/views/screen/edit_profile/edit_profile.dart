import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/color/color.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const routeName = '/edit-profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
      body: SingleChildScrollView(
        child: Container(
          color: whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                                controller: nameController..text = user.name,
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
                                controller: emailController..text = user.email,
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    onPressed: () {},
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
    );
  }
}
