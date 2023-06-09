import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/animation/fade_animation2.dart';
import 'package:staredu/utils/animation/slide_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/screen/course/course_taken_list_screen.dart';
import 'package:staredu/views/screen/edit_profile/edit_profile_screen.dart';
import 'package:staredu/views/screen/history/history_transaction_screen.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/views/screen/profile/profile_view_model.dart';
import 'package:staredu/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:staredu/widgets/profile/section_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PreferencesUtils preferencesUtils;
  String? email;
  late User? user;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      email = preferencesUtils.getPreferencesString('email');
    });
    String? token = preferencesUtils.getPreferencesString('token');
    // ignore: use_build_context_synchronously
    Provider.of<ProfileViewModel>(context, listen: false)
        .getUserDetail(email, token);
  }

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
                        Consumer<ProfileViewModel>(
                            builder: (context, value, child) {
                          return Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: value.response!.profile == '' ||
                                      value.response!.profile ==
                                          'noimage.png' ||
                                      !value.response!.profile!.contains('http')
                                  ? const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/default_mentor.jpg'),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(
                                          value.response!.profile ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        Consumer<ProfileViewModel>(
                          builder: (context, value, child) {
                            user = value.response;
                            return Text(user?.name ?? '',
                                style: GoogleFonts.poppins(
                                  color: whiteColor,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                ));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer<ProfileViewModel>(
                            builder: (context, value, child) {
                          user = value.response;
                          return Text(
                            user?.email ?? '',
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          );
                        }),
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
                    Consumer<ProfileViewModel>(
                      builder: (context, value, child) {
                        user = value.response;
                        return SectionProfile(
                            title: 'Edit Profile',
                            icon: Icons.person_outline,
                            press: () {
                              Navigator.push(
                                  context,
                                  SlideAnimation(
                                      page: const EditProfile(),
                                      arguments: user));
                            });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionProfile(
                        title: 'Transaksi Saya',
                        icon: Icons.payment_outlined,
                        press: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            FadeAnimation2(
                                page: const HistoryTransactionScreen(),
                                arguments: user),
                            (route) => false,
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    SectionProfile(
                        title: 'Kursus Saya',
                        icon: Icons.school_outlined,
                        press: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            FadeAnimation2(
                                page: const CourseTakenListScreen(),
                                arguments: user),
                            (route) => false,
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<ProfileViewModel>(
                        builder: (context, value, child) {
                      return SectionProfile(
                        title: 'Kontak CS',
                        icon: Icons.phone,
                        press: () {
                          value.launchWhatsapp(context, "0895394857389");
                        },
                        iconRight: Icons.call,
                      );
                    }),
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
                        onPressed: () async {
                          await preferencesUtils.savePreferencesBool(
                              'isLogin', false);
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              FadeAnimation(page: const HomeScreen()),
                              (route) => false);
                        },
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
        bottomNavigationBar: BottomNavigationBarComponent(
          indexDefined: 4,
        ));
  }
}
