import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/color/color.dart';
import '../../views/screen/sell_course/sell_course_detail_screen.dart';

class CardCourseForSale extends StatelessWidget {
  const CardCourseForSale({
    super.key,
    required this.id,
    required this.img,
    required this.title,
    required this.rating,
    required this.student,
    required this.price,
    required this.grade,
  });

  final int id;
  final String img;
  final String title;
  final String grade;
  final String rating;
  final String student;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animations, secondaryAnimations) =>
                    SellCourseDetailScreen(
                  id: id,
                  img: img,
                  title: title,
                  rating: rating,
                  student: student,
                  price: price,
                ),
                transitionsBuilder:
                    (context, animations, secondaryAnimations, childs) {
                  final tween = Tween(begin: 0.0, end: 1.0);
                  return FadeTransition(
                    opacity: animations.drive(tween),
                    child: childs,
                  );
                },
              ),
            );
          },
          child: Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Container(
                height: 100,
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
                        img,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 31),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          price,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          grade,
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
                              rating,
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
                              student,
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
