import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/home/home_view_model.dart';
import 'package:staredu/widgets/button/button_text.dart';
import 'package:staredu/widgets/card/card_mentor.dart';
import 'package:staredu/widgets/row/row_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getAllTypeCourse();
    Provider.of<HomeViewModel>(context, listen: false).getAllMentor();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          title: Image.asset(
            "assets/images/logo_text.png",
            width: 120,
            height: 120,
          ),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Selamat Pagi',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold)),
                                Text('Dwi Bagus',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 45,
                              child: Form(
                                  child: TextFormField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  filled: true,
                                  fillColor: whiteColor,
                                  hintText: "Cari kelas yang kamu minati",
                                  hintStyle: const TextStyle(
                                      color: blackColor, fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                ),
                              )),
                            ),
                            SizedBox(
                                height: 45,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/notification');
                                  },
                                  child: Icon(Icons.notifications_on_outlined,
                                      color: whiteColor, size: 35),
                                )),
                            const SizedBox(
                                height: 45,
                                child: Icon(Icons.save_as_outlined,
                                    color: whiteColor, size: 35))
                          ]),
                    ],
                  ),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, -70.0, 0.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Image(
                            image: AssetImage("assets/images/banner.jpg")),
                        const SizedBox(height: 20),
                        const RowText(
                            left: 'Course Populer', right: 'Lihat Semua'),
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
                        const SizedBox(height: 20),
                        const RowText(
                            left: 'Mentor Terbaik Kami', right: 'Lihat Semua'),
                        Consumer<HomeViewModel>(
                          builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: value.mentor
                                  .map((e) => Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      child: CardMentor(name: e.name)))
                                  .toList(),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const RowText(
                            left: 'Seputar Pendidikan di Indonesia',
                            right: 'Lihat Semua'),
                        const SizedBox(height: 20),
                        const RowText(
                            left: 'Yuk, sharing sama pengguna lain',
                            right: 'Lihat Semua'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: Container(
          // give border
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset:
                    const Offset(0, 3), // Offset changes the shadow position
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: whiteColor,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.collections_bookmark),
                  label: 'Kursus',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Transaksi',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Akun',
                ),
              ],
              selectedItemColor: primaryColor,
            ),
          ),
        ));
  }
}
