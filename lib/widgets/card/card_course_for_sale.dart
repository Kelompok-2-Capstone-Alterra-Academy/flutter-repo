import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_formatter/money_formatter.dart';
import '../../utils/animation/fade_animation2.dart';
import '../../utils/color/color.dart';
import '../../views/screen/sell_course/sell_course_detail_screen.dart';

class CardCourseForSale extends StatelessWidget {
  const CardCourseForSale({
    super.key,
    required this.id,
    required this.thumbnail,
    required this.courseName,
    required this.price,
    required this.liveSession,
    required this.description,
    required this.className,
    required this.scores,
    required this.numStudent,
  });

  final int id;
  final String thumbnail;
  final String courseName;
  final String className;
  final double scores;
  final int numStudent;
  final String price;
  final String liveSession;
  final String description;

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: double.parse(price),
      settings: MoneyFormatterSettings(
        symbol: 'Rp',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: '. ',
        fractionDigits: 0,
      ),
    );

    MoneyFormatterOutput fo = fmf.output;
    return Column(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          onTap: () {
            Navigator.of(context).push(FadeAnimation2(
              page: SellCourseDetailScreen(
                id: id,
                thumbnail: thumbnail,
                courseName: courseName,
                rating: scores,
                student: numStudent,
                price: price,
                grade: className,
                liveSession: liveSession,
                description: description,
              ),
            ));
          },
          child: Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.75,
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
                        "assets/images/thumbnail/$thumbnail.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 140,
                          child: Text(
                            courseName,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          fo.symbolOnLeft,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "Kelas $className",
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: warningColor,
                            ),
                            const SizedBox(width: 7),
                            Text(
                              scores.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: searchBarTextColor),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              "|",
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              "${numStudent.toString()} Siswa",
                              style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: searchBarTextColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
