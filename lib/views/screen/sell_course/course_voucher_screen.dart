import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/constant/claimed_voucher_list.dart';
import 'package:staredu/utils/formater/date_format.dart';
import 'package:staredu/views/view_model/sell_course/voucher_view_model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../utils/state/my_state.dart';

class CourseVoucherScreen extends StatefulWidget {
  static const String routeName = "/course_voucher";

  const CourseVoucherScreen({super.key});

  @override
  State<CourseVoucherScreen> createState() => _CourseVoucherScreenState();
}

class _CourseVoucherScreenState extends State<CourseVoucherScreen> {
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

    if (context.mounted) {
      Provider.of<VoucherViewModel>(context, listen: false)
          .getAllVoucher(token);
    }
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
              for (var element in claimedVoucherList) {
                if (element.promoName == value.courseVoucher[index].promoName) {
                  value.courseVoucher[index].isClaim = true;
                }
              }
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  value.courseVoucher[index].isClaim == true
                      ? null
                      : value.claimVoucher(index);
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
                        const SizedBox(width: 15),
                        SizedBox(
                          width: 80,
                          child: Image.asset(
                            value.courseVoucher[index].thumbnail!
                                    .contains("promo")
                                ? "assets/images/${value.courseVoucher[index].thumbnail!}.png"
                                : "assets/images/promo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.courseVoucher[index].promoName!,
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
                                  convertDateFormat(
                                      value.courseVoucher[index].expiredDate!),
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
