import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/view_model/sell_course/sell_course_view_model.dart';
import '../../../utils/animation/fade_animation2.dart';
import '../../../utils/color/color.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../utils/state/my_state.dart';
import '../../../widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'history_transaction_view_model.dart';
import 'note_transaction_screen.dart.dart';

class HistoryTransactionScreen extends StatefulWidget {
  const HistoryTransactionScreen({super.key});
  static const routeName = '/history';

  @override
  State<HistoryTransactionScreen> createState() =>
      _HistoryTransactionScreenState();
}

class _HistoryTransactionScreenState extends State<HistoryTransactionScreen> {
  late PreferencesUtils preferencesUtils;
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    String? token = preferencesUtils.getPreferencesString('token');
    // ignore: use_build_context_synchronously
    Provider.of<HistoryTransactionViewModel>(context, listen: false)
        .getHistory(token!);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: blackColor),
          title: Text(
            "Riwayat Transaksi",
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
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
                child: Consumer<HistoryTransactionViewModel>(
                  builder: (context, value, _) {
                    if (value.myState == MyState.loading) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.blueAccent[100],
                      ));
                    } else if (value.myState == MyState.failed) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Oops, Something Went Wrong!',
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              textAlign: TextAlign.center,
                              'Make Sure Internet is Connected.',
                              style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (value.myState == MyState.success) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        physics: const BouncingScrollPhysics(),
                        itemCount: value.historyCourses.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Card(
                                  elevation: 2,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Container(
                                    height: 100,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 20,
                                    ),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: whiteColor,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          width: 80,
                                          child: Image.asset(
                                            value
                                                    .historyCourses[index]
                                                    .transactionDetails![index]
                                                    .course!
                                                    .thumbnail!
                                                    .isEmpty
                                                ? 'assets/images/thumbnail/apple.png'
                                                : "assets/images/thumbnail/${value.historyCourses[index].transactionDetails![index].course!.thumbnail}.png",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 31),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value
                                                  .historyCourses[index]
                                                  .transactionDetails![index]
                                                  .course!
                                                  .courseName!,
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            Text(
                                              value.historyCourses[index]
                                                  .createdAt!,
                                              style: GoogleFonts.poppins(
                                                fontSize: 11,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              value.historyCourses[index]
                                                  .status!,
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
                                              child: Center(
                                                child: Text(
                                                  "E-Recipt",
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xFF1976D2),
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w600,
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
                              ),
                              const SizedBox(height: 2),
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarComponent());
  }
}
