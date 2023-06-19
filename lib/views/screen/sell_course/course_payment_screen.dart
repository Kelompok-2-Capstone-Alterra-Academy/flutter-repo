import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/slide_animation2.dart';
import 'package:staredu/views/screen/sell_course/claimed_voucher_screen.dart';
import 'package:staredu/views/screen/sell_course/payment_webview.dart';
import 'package:staredu/views/view_model/sell_course/claimed_voucher_view_model.dart';
import 'package:staredu/views/view_model/sell_course/course_payment_view_model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../utils/state/my_state.dart';
import '../../../widgets/sell_course/detail_payment.dart';

class CoursePaymentScreen extends StatefulWidget {
  static const String routeName = "/course_payment";

  final int courseId;
  final String title;
  final String price;
  final String liveSession;

  const CoursePaymentScreen(
      {super.key,
      required this.title,
      required this.price,
      required this.liveSession,
      required this.courseId});

  @override
  State<CoursePaymentScreen> createState() => _CoursePaymentScreenState();
}

class _CoursePaymentScreenState extends State<CoursePaymentScreen> {
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
      Provider.of<CoursePaymentViewModel>(context, listen: false)
          .setToken(token!);
    }

    if (context.mounted) {
      context.read<CoursePaymentViewModel>().promoUsed =
          context.read<ClaimedVoucherViewModel>().activeVoucher;
      context.read<CoursePaymentViewModel>().hargaAwal =
          double.parse(widget.price) + 500;

      if (context.read<CoursePaymentViewModel>().promoUsed == true) {
      } else {
        context.read<CoursePaymentViewModel>().totalBayar =
            context.read<CoursePaymentViewModel>().hargaAwal;
      }
    }
  }

  double setHarga() {
    if (context.read<CoursePaymentViewModel>().promoUsed == true) {
      return context.read<CoursePaymentViewModel>().totalBayar;
    } else {
      return context.read<CoursePaymentViewModel>().totalBayar =
          double.parse(widget.price) + 500;
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CoursePaymentViewModel>(context, listen: false);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengambilan Kursus",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Detail Pengambilan Kursus",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: lightBlueColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      DetailKursus(
                        icon: Icons.menu_book,
                        title: "Nama Kursus",
                        subtitle: widget.title,
                      ),
                      const SizedBox(height: 15),
                      const DetailKursus(
                        icon: Icons.school_outlined,
                        title: "Jenjang",
                        subtitle: "SMA/SMK Kelas 12",
                      ),
                      const SizedBox(height: 15),
                      const DetailKursus(
                        icon: Icons.apps,
                        title: "Section",
                        subtitle: "10 Section",
                      ),
                      const SizedBox(height: 15),
                      DetailKursus(
                        icon: Icons.laptop,
                        title: "Live Session",
                        subtitle: widget.liveSession,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Consumer<CoursePaymentViewModel>(builder: (context, value, _) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        SlideAnimation2(page: const ClaimedVoucherScreen()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: 52,
                    decoration: BoxDecoration(
                      color: value.promoUsed ? lightGreenColor : searchBarColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.verified_outlined,
                            color: value.promoUsed
                                ? successColor
                                : searchBarTextColor,
                            size: 18,
                          ),
                          const SizedBox(width: 11),
                          Text(
                            value.promoUsed
                                ? "Voucher Promo Belajar Berhasil Terpakai"
                                : "Gunakan Vouchermu Sekarang!",
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: value.promoUsed
                                    ? blackColor
                                    : searchBarTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 12),
              Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: lightBlueColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      DetailKursus(
                        icon: Icons.payments_outlined,
                        title: "Harga",
                        subtitle: widget.price,
                      ),
                      const SizedBox(height: 15),
                      const DetailKursus(
                        icon: Icons.payments_rounded,
                        title: "Biaya Admin",
                        subtitle: "Rp. 500",
                      ),
                      const SizedBox(height: 15),
                      Divider(
                        color: primaryColor.withOpacity(0.3),
                        thickness: 2,
                      ),
                      const SizedBox(height: 15),
                      Consumer<CoursePaymentViewModel>(
                          builder: (context, value, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Pembayaran",
                              style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor2),
                            ),
                            Text(
                              "Rp. ${value.totalBayar.round().toString()}",
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.25),
              Consumer<CoursePaymentViewModel>(builder: (context, value, _) {
                return Container(
                  height: 42,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        value.stateSet(MyState.loading);
                        String message = await value.payment(
                          int.parse(widget.price),
                          widget.courseId.toString(),
                          int.parse(value.totalBayar.round().toString()),
                          value.tokens!,
                        );

                        if (message.contains('success')) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentWebview(
                                url: value.response["redirectURL"],
                              ),
                            ),
                            (route) => route.isFirst,
                          );
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(message),
                            ));
                          }
                        }

                        // showDialog(
                        //   context: context,
                        //   builder: (context) => AlertDialog(
                        //     shape: const RoundedRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(16))),
                        //     content: Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         const SizedBox(height: 50),
                        //         SizedBox(
                        //           child: Image.asset(
                        //               "assets/images/new_course_popup.png"),
                        //         ),
                        //         const SizedBox(height: 24),
                        //         Text(
                        //           "Yeay, Kamu Punya Kursus Baru!",
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w600,
                        //               color: blackColor),
                        //         ),
                        //         const SizedBox(height: 12),
                        //         Text(
                        //           textAlign: TextAlign.center,
                        //           "Pembayaran kamu sukses dan kamu bisa segera memulai pembelajaran",
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 11,
                        //               fontWeight: FontWeight.w400,
                        //               color: blackColor),
                        //         ),
                        //         const SizedBox(height: 12),

                        //         //Button Lihat Modul
                        //         Container(
                        //           height: 42,
                        //           width: screenWidth,
                        //           decoration: const BoxDecoration(
                        //             color: primaryColor,
                        //             borderRadius: BorderRadius.all(
                        //               Radius.circular(8),
                        //             ),
                        //           ),
                        //           child: Material(
                        //             color: Colors.transparent,
                        //             child: InkWell(
                        //               onTap: () {
                        //                 Navigator.of(context).push(FadeAnimation2(
                        //                     page: const CourseTakenListScreen()));
                        //               },
                        //               child: Padding(
                        //                 padding: const EdgeInsets.only(
                        //                     left: 10, right: 12),
                        //                 child: Center(
                        //                   child: Text(
                        //                     "Lihat Modul",
                        //                     style: GoogleFonts.poppins(
                        //                         color: whiteColor,
                        //                         fontSize: 13,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(height: 10),

                        //         //Button Riwayat Transaksi
                        //         Container(
                        //           height: 42,
                        //           width: screenWidth,
                        //           decoration: BoxDecoration(
                        //             color: whiteColor,
                        //             border: Border.all(color: primaryColor),
                        //             borderRadius: const BorderRadius.all(
                        //               Radius.circular(8),
                        //             ),
                        //           ),
                        //           child: Material(
                        //             color: Colors.transparent,
                        //             child: InkWell(
                        //               onTap: () {
                        //                 Navigator.of(context).push(FadeAnimation2(
                        //                     page:
                        //                         const HistoryTransactionScreen()));
                        //               },
                        //               child: Padding(
                        //                 padding: const EdgeInsets.only(
                        //                     left: 10, right: 12),
                        //                 child: Center(
                        //                   child: Text(
                        //                     "Riwayat Transaksi",
                        //                     style: GoogleFonts.poppins(
                        //                         color: primaryColor,
                        //                         fontSize: 13,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 12),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: GoogleFonts.poppins(
                                color: whiteColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
