import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/module_details_model.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ModuleVideoScreen extends StatefulWidget {
  static const String routeName = "/modulevideo";

  final int? courseId;
  final int? sectionId;
  final String? courseName;
  final String? sectionName;

  const ModuleVideoScreen(
      {super.key,
      this.courseId,
      this.sectionId,
      this.courseName,
      this.sectionName});

  @override
  State<ModuleVideoScreen> createState() => _ModuleVideoScreenState();
}

class _ModuleVideoScreenState extends State<ModuleVideoScreen> {
  late YoutubePlayerController _videoController;
  late List linkVideo;

  @override
  void initState() {
    super.initState();
    Provider.of<ModuleListViewModel>(context, listen: false).getSectionVideo();
    _videoController = YoutubePlayerController(
      initialVideoId: 'tATNYnFTetg',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        forceHD: false,
        enableCaption: true,
        loop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final moduleViewModel =
    //     Provider.of<ModuleListViewModel>(context, listen: false);
    // final linkVideo = moduleViewModel.detailVideo.where((detailVideo) =>
    //     detailVideo.courseId == widget.courseId &&
    //     detailVideo.sectionId == widget.sectionId);
    return Consumer<ModuleListViewModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: whiteColor,
            foregroundColor: blackColor,
            elevation: 0,
            title: Text(
              "Video Pembelajaran",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _videoController,
                width: screenWidth,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.redAccent,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red,
                  bufferedColor: Colors.redAccent,
                ),
                onReady: () {
                  // _videoController.load(value.detailVideo);
                },
                topActions: <Widget>[
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      _videoController.metadata.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  '${widget.courseName} - ${widget.sectionName}',
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ListView(
                    children: [
                      Text(
                        'testing description : Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent arcu enim, pretium in justo et, fringilla sagittis dui. Cras mauris nibh, pretium ut dignissim id, iaculis consequat ligula. Nulla non pulvinar turpis, id maximus nisl. Ut condimentum enim ligula. Morbi dui erat, laoreet sodales feugiat eu, lobortis fringilla massa. Nam pretium arcu quis eros volutpat interdum. Proin hendrerit tellus non arcu sollicitudin, at sollicitudin nibh imperdiet. Aliquam semper feugiat nisl et ultrices. Mauris consequat elementum lectus, sed sollicitudin ipsum. Aenean consequat tellus vel sapien facilisis, non venenatis velit laoreet. Etiam non venenatis ante. Vivamus vel quam iaculis diam consectetur molestie et in nulla. Aenean ultrices, ex sit amet dignissim interdum, libero augue commodo urna, tincidunt mattis eros magna sed turpis. Vestibulum aliquet nibh massa, a auctor arcu tristique in. Integer imperdiet vestibulum lacus quis tristique. Quisque scelerisque nisi convallis enim hendrerit consectetur.',
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: const EdgeInsets.only(bottom: 16),
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
                        "Selesai",
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: const EdgeInsets.only(bottom: 16),
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
                        "Tanya Mentor",
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
        );
      },
      // child: YoutubePlayerBuilder(
      //   player: YoutubePlayer(
      //     controller: _videoController,
      //     width: screenWidth,
      //     showVideoProgressIndicator: true,
      //     progressIndicatorColor: Colors.redAccent,
      //     progressColors: const ProgressBarColors(
      //       playedColor: Colors.red,
      //       handleColor: Colors.red,
      //       bufferedColor: Colors.redAccent,
      //     ),
      //     onReady: () {
      //       // _videoController.load(linkVideo.toString());
      //       print(linkVideo?.link);
      //     },
      //     topActions: <Widget>[
      //       const SizedBox(width: 8.0),
      //       Expanded(
      //         child: Text(
      //           _videoController.metadata.title,
      //           style: GoogleFonts.poppins(
      //             color: Colors.white,
      //             fontSize: 18.0,
      //           ),
      //           overflow: TextOverflow.ellipsis,
      //           maxLines: 1,
      //         ),
      //       ),
      //     ],
      //   ),
      //   builder: (context, player) => Scaffold(
      //     appBar: AppBar(
      //       centerTitle: true,
      //       backgroundColor: whiteColor,
      //       foregroundColor: blackColor,
      //       elevation: 0,
      //       title: Text(
      //         "Video Pembelajaran",
      //         style: GoogleFonts.poppins(
      //           fontStyle: FontStyle.normal,
      //           fontWeight: FontWeight.w600,
      //           fontSize: 17,
      //         ),
      //       ),
      //     ),
      //     body: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         player,
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 16, right: 16),
      //           child: Text(
      //             '${widget.courseName} - ${widget.sectionName}',
      //             style: GoogleFonts.poppins(
      //               fontStyle: FontStyle.normal,
      //               fontWeight: FontWeight.w600,
      //               fontSize: 14,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 12,
      //         ),
      //         Expanded(
      //           child: Container(
      //             padding: const EdgeInsets.only(left: 16, right: 16),
      //             child: ListView(
      //               children: [
      //                 Text(
      //                   'testing description : Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent arcu enim, pretium in justo et, fringilla sagittis dui. Cras mauris nibh, pretium ut dignissim id, iaculis consequat ligula. Nulla non pulvinar turpis, id maximus nisl. Ut condimentum enim ligula. Morbi dui erat, laoreet sodales feugiat eu, lobortis fringilla massa. Nam pretium arcu quis eros volutpat interdum. Proin hendrerit tellus non arcu sollicitudin, at sollicitudin nibh imperdiet. Aliquam semper feugiat nisl et ultrices. Mauris consequat elementum lectus, sed sollicitudin ipsum. Aenean consequat tellus vel sapien facilisis, non venenatis velit laoreet. Etiam non venenatis ante. Vivamus vel quam iaculis diam consectetur molestie et in nulla. Aenean ultrices, ex sit amet dignissim interdum, libero augue commodo urna, tincidunt mattis eros magna sed turpis. Vestibulum aliquet nibh massa, a auctor arcu tristique in. Integer imperdiet vestibulum lacus quis tristique. Quisque scelerisque nisi convallis enim hendrerit consectetur.',
      //                   style: GoogleFonts.poppins(
      //                     fontStyle: FontStyle.normal,
      //                     fontWeight: FontWeight.w400,
      //                     fontSize: 11,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Container(
      //               width: MediaQuery.of(context).size.width / 2.3,
      //               margin: const EdgeInsets.only(bottom: 16),
      //               child: OutlinedButton(
      //                 style: OutlinedButton.styleFrom(
      //                   foregroundColor: whiteColor,
      //                   backgroundColor: primaryColor,
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(8),
      //                   ),
      //                 ),
      //                 onPressed: () {},
      //                 child: Text(
      //                   "Selesai",
      //                   style: GoogleFonts.poppins(
      //                     fontStyle: FontStyle.normal,
      //                     fontWeight: FontWeight.w600,
      //                     fontSize: 13,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Container(
      //               width: MediaQuery.of(context).size.width / 2.3,
      //               margin: const EdgeInsets.only(bottom: 16),
      //               child: OutlinedButton(
      //                 style: OutlinedButton.styleFrom(
      //                   foregroundColor: primaryColor,
      //                   side: const BorderSide(color: primaryColor),
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(8),
      //                   ),
      //                 ),
      //                 onPressed: () {},
      //                 child: Text(
      //                   "Tanya Mentor",
      //                   style: GoogleFonts.poppins(
      //                     fontStyle: FontStyle.normal,
      //                     fontWeight: FontWeight.w600,
      //                     fontSize: 13,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
