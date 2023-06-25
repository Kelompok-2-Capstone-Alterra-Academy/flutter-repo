import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/formater/date_format.dart';
import 'package:staredu/views/view_model/sell_course/claimed_voucher_view_model.dart';
import '../../../utils/color/color.dart';

class ClaimedVoucherScreen extends StatefulWidget {
  static const String routeName = "/claimed_voucher";

  const ClaimedVoucherScreen({super.key});

  @override
  State<ClaimedVoucherScreen> createState() => _ClaimedVoucherScreenState();
}

class _ClaimedVoucherScreenState extends State<ClaimedVoucherScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (context.mounted) {
      Provider.of<ClaimedVoucherViewModel>(context, listen: false)
          .getAllClaimedVoucher();
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ClaimedVoucherViewModel>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gunakan Promo",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<ClaimedVoucherViewModel>(builder: (context, value, _) {
        return ListView.builder(
          itemCount: value.claimedVoucher.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                value.setActiveVoucher(index, context);
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
                          value.claimedVoucher[index].thumbnail!
                                  .contains("promo")
                              ? "assets/images/${value.claimedVoucher[index].thumbnail!}.png"
                              : "assets/images/promo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.claimedVoucher[index].promoName!,
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
                                    value.claimedVoucher[index].expiredDate!),
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
                                value.claimedVoucher[index].description!,
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
                                  value.claimedVoucher[index].promoUse == false
                                      ? subjectColor
                                      : successColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                value.claimedVoucher[index].promoUse == false
                                    ? "Gunakan Promo Ini"
                                    : "Promo Sedang Digunakan",
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: value.claimedVoucher[index].promoUse ==
                                          false
                                      ? blackColor
                                      : whiteColor,
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
      }),
    );
  }
}
