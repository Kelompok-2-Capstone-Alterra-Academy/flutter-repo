import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color/color.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({
    super.key,
    required this.width,
    required this.text,
    required this.iconImg,
    required this.bgColor,
    required this.borderColor,
  });

  final double width;
  final String text;
  final String iconImg;
  final Color bgColor;
  final Color borderColor;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool toggleButton1 = false; //Button Kelas 10
  bool toggleButton2 = false; //Button Kelas 11
  bool toggleButton3 = false; //Button Kelas 12
  bool toggleButton4 = false; //Button Kelas 10 SMK
  bool toggleButton5 = false; //Button Kelas 11 SMK
  bool toggleButton6 = false; //Button Kelas 12 SMK

  bool toggle1 = false; //Button IPA
  bool toggle2 = false; //Button IPS
  bool toggle3 = false; //Button Mutlimedia
  bool toggle4 = false; //Button TKJ
  bool toggle5 = false; //Button RPL
  bool toggle6 = false; //Button Umum

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 42,
      width: widget.width * 0.42,
      decoration: BoxDecoration(
        color: widget.bgColor,
        border: Border.all(width: 1.5, color: widget.borderColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      padding: const EdgeInsets.all(20.0),
                      height: screenHeight * 0.76,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pilih kelas kamu dulu ya untuk mencari kursus yang diinginkan",
                            style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 35),
                          Text(
                            "Pilih Kelas",
                            style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Kelas 10
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color: toggleButton1
                                        ? lightBlueColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: toggleButton1
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggleButton2 ||
                                        toggleButton3 ||
                                        toggleButton4 ||
                                        toggleButton5 ||
                                        toggleButton6 == true) {
                                    } else {
                                      setState(() {
                                        toggleButton1 = !toggleButton1;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Kelas 10",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              // Kelas 11
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color: toggleButton2
                                        ? lightBlueColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: toggleButton2
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggleButton1 ||
                                        toggleButton3 ||
                                        toggleButton4 ||
                                        toggleButton5 ||
                                        toggleButton6 == true) {
                                    } else {
                                      setState(() {
                                        toggleButton2 = !toggleButton2;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Kelas 11",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              // Kelas 12
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color: toggleButton3
                                        ? lightBlueColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: toggleButton3
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggleButton1 ||
                                        toggleButton2 ||
                                        toggleButton4 ||
                                        toggleButton5 ||
                                        toggleButton6 == true) {
                                    } else {
                                      setState(() {
                                        toggleButton3 = !toggleButton3;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Kelas 12",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 26),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Kelas 10 SMK
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color: toggleButton4
                                        ? lightBlueColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: toggleButton4
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggleButton1 ||
                                        toggleButton2 ||
                                        toggleButton3 ||
                                        toggleButton5 ||
                                        toggleButton6 == true) {
                                    } else {
                                      setState(() {
                                        toggleButton4 = !toggleButton4;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Kelas 10 SMK",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              //Kelas 11 SMK
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color: toggleButton5
                                        ? lightBlueColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: toggleButton5
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggleButton1 ||
                                        toggleButton2 ||
                                        toggleButton3 ||
                                        toggleButton4 ||
                                        toggleButton6 == true) {
                                    } else {
                                      setState(() {
                                        toggleButton5 = !toggleButton5;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Kelas 11 SMK",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              //Kelas 12 SMK
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color: toggleButton6
                                        ? lightBlueColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: toggleButton6
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggleButton1 ||
                                        toggleButton2 ||
                                        toggleButton3 ||
                                        toggleButton4 ||
                                        toggleButton5 == true) {
                                    } else {
                                      setState(() {
                                        toggleButton6 = !toggleButton6;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Kelas 12 SMK",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //JURUSAN
                          const SizedBox(height: 31),
                          Text(
                            "Pilih Jurusan",
                            style: GoogleFonts.poppins(
                                color: blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // IPA
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color:
                                        toggle1 ? lightBlueColor : whiteColor,
                                    border: Border.all(
                                      color: toggle1
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggle2 ||
                                        toggle3 ||
                                        toggle4 ||
                                        toggle5 ||
                                        toggle6 == true) {
                                    } else {
                                      setState(() {
                                        toggle1 = !toggle1;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "IPA",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              // IPS
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color:
                                        toggle2 ? lightBlueColor : whiteColor,
                                    border: Border.all(
                                      color: toggle2
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggle1 ||
                                        toggle3 ||
                                        toggle4 ||
                                        toggle5 ||
                                        toggle6 == true) {
                                    } else {
                                      setState(() {
                                        toggle2 = !toggle2;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "IPS",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              // Multimedia
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color:
                                        toggle3 ? lightBlueColor : whiteColor,
                                    border: Border.all(
                                      color: toggle3
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggle1 ||
                                        toggle2 ||
                                        toggle4 ||
                                        toggle5 ||
                                        toggle6 == true) {
                                    } else {
                                      setState(() {
                                        toggle3 = !toggle3;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Multimedia",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 26),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //TKJ
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color:
                                        toggle4 ? lightBlueColor : whiteColor,
                                    border: Border.all(
                                      color: toggle4
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggle1 ||
                                        toggle2 ||
                                        toggle3 ||
                                        toggle5 ||
                                        toggle6 == true) {
                                    } else {
                                      setState(() {
                                        toggle4 = !toggle4;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "TKJ",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              //RPL
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color:
                                        toggle5 ? lightBlueColor : whiteColor,
                                    border: Border.all(
                                      color: toggle5
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggle1 ||
                                        toggle2 ||
                                        toggle3 ||
                                        toggle4 ||
                                        toggle6 == true) {
                                    } else {
                                      setState(() {
                                        toggle5 = !toggle5;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "RPL",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),

                              //Umum
                              Container(
                                height: 35,
                                width: 96,
                                decoration: BoxDecoration(
                                    color:
                                        toggle6 ? lightBlueColor : whiteColor,
                                    border: Border.all(
                                      color: toggle6
                                          ? primaryColor
                                          : searchBarTextColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: InkWell(
                                  splashColor: lightBlueColor,
                                  onTap: () {
                                    if (toggle1 ||
                                        toggle2 ||
                                        toggle3 ||
                                        toggle4 ||
                                        toggle5 == true) {
                                    } else {
                                      setState(() {
                                        toggle6 = !toggle6;
                                      });
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Umum",
                                      style: GoogleFonts.poppins(
                                          color: blackColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 120,
                          ),

                          //Button Simpan
                          Container(
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
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 12),
                                  child: Center(
                                    child: Text(
                                      "Simpan",
                                      style: GoogleFonts.poppins(
                                          color: whiteColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  widget.iconImg,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
