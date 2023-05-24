import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  bool isRatingInputted = false;
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 56,
              ),
              const Image(
                image:
                    AssetImage('assets/images/finish_course_dialog_image.jpg'),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Kerja Bagus!",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: width / 1.4,
                child: Center(
                  child: Text(
                    "Kamu telah menyelesaikan kursus, seberapa kamu puas dengan kursusnya?",
                    style: GoogleFonts.poppins(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                initialRating: 0,
                glowColor: starReviewColor,
                direction: Axis.horizontal,
                glowRadius: 1,
                allowHalfRating: true,
                unratedColor: searchBarColor,
                itemSize: 46,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.5),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: starReviewColor,
                ),
                onRatingUpdate: (value) {
                  //based on changed rating
                  setState(() {
                    isRatingInputted = true;
                    rating = value;
                  });
                },
              ),
              const SizedBox(
                height: 24,
              ),
              AnimatedContainer(
                height: isRatingInputted ? 146 : 0, // Set the desired height
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: 146,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Visibility(
                    visible: isRatingInputted,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Berikan ulasan anda untuk kursus ini",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: "Tulis Ulasan..",
                              hintStyle: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: searchBarTextColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: blackColor,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: whiteColor,
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Kirim Ulasan",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(
                      bottom: 16,
                      left: 24,
                      right: 24,
                    ),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryColor,
                        side: const BorderSide(color: primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Kembali ke Kursus",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
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
  }
}