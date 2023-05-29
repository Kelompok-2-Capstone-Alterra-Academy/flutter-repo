import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:staredu/widgets/profile/section_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Profil',
              style: GoogleFonts.poppins(
                color: whiteColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 190,
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Center(
                    child: Column(
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
                        const SizedBox(
                          height: 15,
                        ),
                        Text('Ericha Septioana',
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ericha@gmail.com',
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SectionProfile(
                        title: 'Edit Profile',
                        icon: Icons.person_outline,
                        press: () {
                          Navigator.pushNamed(context, '/edit-profile');
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionProfile(
                        title: 'Transaksi Saya',
                        icon: Icons.payment_outlined,
                        press: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionProfile(
                        title: 'Kursus Saya',
                        icon: Icons.collections_bookmark_outlined,
                        press: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionProfile(
                      title: 'Kontak CS',
                      icon: Icons.contact_support_outlined,
                      press: () {},
                      iconRight: Icons.phone_android_outlined,
                    ),
                    const SizedBox(
                      height: 30,
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
                              side: const BorderSide(
                                  color: primaryColor, width: 0.5),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return primaryColor;
                              }
                              return whiteColor;
                            },
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Keluar",
                            style: GoogleFonts.poppins(
                              color: primaryColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarComponent());
  }
}
