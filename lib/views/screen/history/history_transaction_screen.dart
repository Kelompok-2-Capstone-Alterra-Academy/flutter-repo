import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/service/course_history_model.dart';
import '../../../utils/color/color.dart';
import 'note_transaction_screen.dart.dart';

class HistoryTransactionScreen extends StatefulWidget {
  const HistoryTransactionScreen({super.key});

  @override
  State<HistoryTransactionScreen> createState() =>
      _HistoryTransactionScreenState();
}

class _HistoryTransactionScreenState extends State<HistoryTransactionScreen> {
  List<CourseHistoryModel> historyCourses = [
    CourseHistoryModel(
      id: 1,
      title: "Matematika",
      order: "Tanggal Order : 15 JAnuari 2023",
      img: "assets/images/calculator.jpg",
    ),
    CourseHistoryModel(
      id: 2,
      title: "Bahasa Inggris",
      order: "Tanggal Order : 25 Februari 2023",
      img: "assets/images/calculator.jpg",
    ),
    CourseHistoryModel(
      id: 3,
      title: "Geografi",
      order: "Tanggal Order : 30 Maret 2023",
      img: "assets/images/calculator.jpg",
    ),
    CourseHistoryModel(
      id: 4,
      title: "Ekonomi",
      order: "Tanggal Order : 05 April 2023",
      img: "assets/images/calculator.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 75),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 55),
                Text(
                  "Riwayat Transaksi",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: searchBarColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_rounded,
                            color: searchBarTextColor,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Mau belajar apa hari ini? Cari di sini",
                            style: GoogleFonts.poppins(
                              color: searchBarTextColor,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.filter_list,
                  color: searchBarTextColor,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 8),
                physics: const BouncingScrollPhysics(),
                itemCount: historyCourses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: whiteColor,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  historyCourses[index].img!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 31),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    historyCourses[index].title!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    historyCourses[index].order!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    height: 20,
                                    width: 154,
                                    decoration: const BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  NoteTransactionScreen(),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            "E-Recipt",
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF1976D2),
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}