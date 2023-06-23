import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/schedule_model.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/animation/slide_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/constant/list_post_feed.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/screen/auth/login/login_screen.dart';
import 'package:staredu/views/screen/home/home_view_model.dart';
import 'package:staredu/views/screen/mentor/mentor_screen.dart';
import 'package:staredu/views/screen/news/news_screen.dart';
import 'package:staredu/views/screen/notification/notification_screen.dart';
import 'package:staredu/views/screen/post_feed/post_feed_screen.dart';
import 'package:staredu/views/screen/sell_course/sell_course_screen.dart';
import 'package:staredu/views/screen/wishlist/wishlist_screen.dart';
import 'package:staredu/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:staredu/widgets/button/button_text.dart';
import 'package:staredu/widgets/card/card_course_taken.dart';
import 'package:staredu/widgets/button/button_full.dart';
import 'package:staredu/widgets/card/card_live_session.dart';
import 'package:staredu/widgets/card/card_mentor.dart';
import 'package:staredu/widgets/card/card_task_list.dart';
import 'package:staredu/widgets/carousel/carousel_component.dart';
import 'package:staredu/widgets/news/news.dart';
import 'package:staredu/widgets/post_feed/post_feed.dart';
import 'package:staredu/widgets/row/row_text.dart';

import '../../../utils/animation/fade_animation2.dart';
import '../../../utils/animation/slide_animation2.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PreferencesUtils preferencesUtils;
  String? token;
  bool? isLogin = false;
  ScheduleCourseModel scheduleCourseModel = ScheduleCourseModel(
      course: 'course', date: 'date', status: 'status', url: 'url');

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      token = preferencesUtils.getPreferencesString('token');
      isLogin = preferencesUtils.getPreferencesBool('isLogin');
    });
    // ignore: use_build_context_synchronously
    Provider.of<HomeViewModel>(context, listen: false).getAllTypeCourse(token);
    // ignore: use_build_context_synchronously
    Provider.of<HomeViewModel>(context, listen: false).getAllMentor(token);
    // ignore: use_build_context_synchronously
    Provider.of<HomeViewModel>(context, listen: false).getAllCourses(token);
    // ignore: use_build_context_synchronously
    Provider.of<HomeViewModel>(context, listen: false).getPostFeed();
  }

  @override
  void initState() {
    super.initState();

    Provider.of<HomeViewModel>(context, listen: false).getAllTypeCourse();
    Provider.of<HomeViewModel>(context, listen: false).getAllMentor();
    Provider.of<HomeViewModel>(context, listen: false).getPostFeed();
    Provider.of<HomeViewModel>(context, listen: false).getAllNews();

    init();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          title: Image.asset(
            "assets/images/logo_text.png",
            width: 120,
            height: 120,
          ),
          // action
          actions: isLogin == null || isLogin == false
              ? [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 80,
                      child: ButtonFull(
                          title: 'Masuk',
                          color: whiteColor,
                          textColor: primaryColor,
                          borderColor: primaryColor,
                          press: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                SlideAnimation(page: const LoginScreen()),
                                (route) => false);
                          }),
                    ),
                  )
                ]
              : null,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 170,
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      isLogin != null && isLogin == true
                          ? Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Selamat Pagi',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  color: whiteColor,
                                                  fontWeight: FontWeight.w400)),
                                          Text('Dwi Bagus',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: whiteColor,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              FadeAnimation(
                                                  page: const Profile()));
                                        },
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/default_mentor.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(height: 10),
                              ],
                            )
                          : Container(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadeAnimation2(
                                        page: const SellCourseScreen()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: whiteColor),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 15),
                                    const Icon(
                                      Icons.search,
                                      color: greyColor2,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Cari kelas yang kamu minati",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: greyColor2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 45,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        SlideAnimation2(
                                            page: const NotificationScreen()));
                                  },
                                  child: const Icon(Icons.notifications_none,
                                      color: whiteColor, size: 28),
                                )),
                            SizedBox(
                                height: 45,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        SlideAnimation2(
                                            page: const WishlistScreen()));
                                  },
                                  child: const Icon(
                                      Icons.collections_bookmark_outlined,
                                      color: whiteColor,
                                      size: 28),
                                ))
                          ]),
                    ],
                  ),
                ),
              ),
            ),
            Transform(
              transform: isLogin != null && isLogin == true
                  ? Matrix4.translationValues(0.0, -70.0, 0.0)
                  : Matrix4.translationValues(0.0, -100.0, 0.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        //give border on image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/banner.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // TODO change data dummy in here
                        isLogin != null && isLogin == true
                            ? Column(
                                children: const [
                                  RowText(
                                      left: 'Course yang diikuti',
                                      right: 'Lihat Semua',
                                      page: SellCourseScreen()),
                                  CardCourseTaken(
                                      id: 1,
                                      title: 'title',
                                      img: 'assets/images/thumbnail/apple.png',
                                      currentSection: 'currentSection',
                                      totalSection: 'totalSection',
                                      progress: 50),
                                  SizedBox(height: 20),
                                ],
                              )
                            : Container(),
                        isLogin != null && isLogin == true
                            ? Column(
                                children: [
                                  const RowText(
                                      left: 'Presensi',
                                      right: 'Lihat Semua',
                                      page: SellCourseScreen()),
                                  CardLiveSession(
                                      schedule: scheduleCourseModel, index: 1),
                                  const SizedBox(height: 20),
                                ],
                              )
                            : Container(),
                        isLogin != null && isLogin == true
                            ? Column(
                                children: const [
                                  RowText(
                                      left: 'Tugas Terkini',
                                      right: 'Lihat Semua',
                                      page: SellCourseScreen()),
                                  CardTaskList(
                                      sectionNumbering: 1,
                                      sectionName: 'sectionName',
                                      courseName: 'courseName',
                                      isAssignmentAvailable: true),
                                  SizedBox(height: 20),
                                ],
                              )
                            : Container(),
                        const RowText(
                            left: 'Course Populer',
                            right: 'Lihat Semua',
                            page: SellCourseScreen()),
                        const SizedBox(height: 10),
                        Consumer<HomeViewModel>(
                          builder: (context, value, child) {
                            return SingleChildScrollView(
                              // horisontal
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: value.typeCourse
                                    .map((e) => Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: e.id == 1
                                            ? ButtonText(
                                                text: e.name,
                                                press: () {},
                                                isSelected: true)
                                            : ButtonText(
                                                text: e.name, press: () {})))
                                    .toList(),
                              ),
                            );
                          },
                        ),
                        Consumer<HomeViewModel>(
                            builder: (context, value, child) {
                          return SizedBox(
                            height: 200,
                            child: CarouselComponent(),
                          );
                        }),

                        const RowText(
                            left: 'Mentor Terbaik Kami',
                            right: 'Lihat Semua',
                            page: MentorScreen()),
                        const SizedBox(height: 10),
                        Consumer<HomeViewModel>(
                          builder: (context, value, child) {
                            return value.mentor.isEmpty
                                ? const CircularProgressIndicator()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: value.mentor
                                        .map((e) => Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            child: CardMentor(
                                              name: e.name.split(' ').last,
                                              profile: e.profile,
                                            )))
                                        .toList(),
                                  );
                          },
                        ),
                        const SizedBox(height: 20),
                        const RowText(
                            left: 'Seputar Pendidikan di Indonesia',
                            right: 'Lihat Semua',
                            page: NewsScreen()),
                        Consumer<HomeViewModel>(
                          builder: (context, value, child) {
                            if (value.news.isNotEmpty) {
                              final newsItem =
                                  value.news[0]; // Ambil item berita pertama
                              return News(
                                screenWidth: MediaQuery.of(context).size.width,
                                link: newsItem.link,
                                shortDescription: newsItem.content,
                                tittle: newsItem.title,
                              );
                            } else {
                              return Container(); // Tampilkan widget kosong jika tidak ada berita
                            }
                          },
                        ),

                        const SizedBox(height: 20),
                        const RowText(
                            left: 'Yuk, sharing sama pengguna lain',
                            right: 'Lihat Semua',
                            page: PostFeedScreen()),
                        PostFeed(
                          index: 0,
                          postFeeds: postFeedsList,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: isLogin != null && isLogin == true
            ? BottomNavigationBarComponent(
                indexDefined: 0,
              )
            : null);
  }
}
