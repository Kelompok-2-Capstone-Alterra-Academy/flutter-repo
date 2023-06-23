import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../views/screen/news/web_view_screen.dart';

class News extends StatelessWidget {
  const News({
    Key? key,
    required this.screenWidth,
    required this.link,
    required this.tittle,
    required this.shortDescription,
  }) : super(key: key);

  final double screenWidth;
  final String link;
  final String tittle;
  final String shortDescription;

  @override
  Widget build(BuildContext context) {
    // final newsViewModel = Provider.of<NewsViewModel>(context);
    // final newsList = newsViewModel.newsList;
    // final news = newsList;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: link!),
          ),
        );
      },
      child: Container(
        width: screenWidth,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   value.newsList[index].portal!,
                      //   style: GoogleFonts.poppins(
                      //     fontSize: 9,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      Text(
                        tittle!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        shortDescription!,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/news1.png',
                    // value.newsList[index].img!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
