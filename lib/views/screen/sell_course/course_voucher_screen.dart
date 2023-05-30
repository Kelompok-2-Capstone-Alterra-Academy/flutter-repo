import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/constant/voucher_list.dart';
import '../../../utils/color/color.dart';

class CourseVoucherScreen extends StatefulWidget {
  static const String routeName = "/course_voucher";

  const CourseVoucherScreen({super.key});

  @override
  State<CourseVoucherScreen> createState() => _CourseVoucherScreenState();
}

class _CourseVoucherScreenState extends State<CourseVoucherScreen> {
  bool isClaim = false;

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: voucherList.length,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              setState(() {
                isClaim = !isClaim;
              });
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
                        voucherList[index].img!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          voucherList[index].title!,
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
                              voucherList[index].expired!,
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
                              voucherList[index].description!,
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
                            color: isClaim ? subjectColor : successColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              isClaim ? "Klaim Promo" : "Promo Di Claim",
                              style: GoogleFonts.poppins(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: isClaim ? blackColor : whiteColor,
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
      ),
    );
  }
}
