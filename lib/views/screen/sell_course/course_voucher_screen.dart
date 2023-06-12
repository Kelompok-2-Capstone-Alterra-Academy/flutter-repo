import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/constant/voucher_list.dart';
import 'package:staredu/views/view_model/sell_course/voucher_view_model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/state/my_state.dart';

class CourseVoucherScreen extends StatefulWidget {
  static const String routeName = "/course_voucher";

  const CourseVoucherScreen({super.key});

  @override
  State<CourseVoucherScreen> createState() => _CourseVoucherScreenState();
}

class _CourseVoucherScreenState extends State<CourseVoucherScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        final provider = Provider.of<VoucherViewModel>(context, listen: false);

        provider.getAllVoucher();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<VoucherViewModel>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Promo Saya",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<VoucherViewModel>(builder: (context, value, _) {
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
            itemCount: value.courseVoucher.length,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  value.claimVoucher(index);
                },
                child: Card(
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Container(
                    height: 115,
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: whiteColor,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.asset(
                            value.courseVoucher[index].img!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.courseVoucher[index].title!,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Text(
                                  "Masa Berlaku:  ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  value.courseVoucher[index].expired!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SizedBox(
                                width: screenWidth * 0.55,
                                child: Text(
                                  overflow: TextOverflow.clip,
                                  value.courseVoucher[index].description!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 18,
                              width: 154,
                              decoration: BoxDecoration(
                                color:
                                    value.courseVoucher[index].isClaim == true
                                        ? successColor
                                        : subjectColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  value.courseVoucher[index].isClaim == true
                                      ? "Promo Di Claim"
                                      : "Klaim Promo",
                                  style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: value.courseVoucher[index].isClaim ==
                                            true
                                        ? whiteColor
                                        : blackColor,
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
      }),
    );
  }
}
