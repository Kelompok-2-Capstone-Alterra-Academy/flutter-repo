import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import 'package:staredu/views/view_model/course/module_view_model.dart';
import 'package:staredu/widgets/course/review_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ModuleVideoScreen extends StatefulWidget {
  static const String routeName = "/modulevideo";

  final int? courseId;
  final int? sectionId;
  final String? courseName;
  final String? sectionName;
  final String? moduleName;
  final String? linkModule;
  final String? description;
  final bool isLastIndex;

  const ModuleVideoScreen({
    super.key,
    this.courseId,
    this.sectionId,
    this.courseName,
    this.sectionName,
    this.moduleName,
    this.linkModule,
    this.description,
    required this.isLastIndex,
  });

  @override
  State<ModuleVideoScreen> createState() => _ModuleVideoScreenState();
}

class _ModuleVideoScreenState extends State<ModuleVideoScreen> {
  late YoutubePlayerController _videoController;
  late List linkVideo;

  @override
  void initState() {
    super.initState();
    String newId =
        YoutubePlayer.convertUrlToId(widget.linkModule.toString()).toString();
    _videoController = YoutubePlayerController(
      initialVideoId: newId,
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
    print(widget.courseName.toString());
    final double screenWidth = MediaQuery.of(context).size.width;
    final String linkVideo =
        YoutubePlayer.convertUrlToId(widget.linkModule.toString()).toString();
    return Consumer<ModuleListViewModel>(
      builder: (context, value, _) {
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return YoutubePlayer(
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
                      _videoController.load(linkVideo);
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
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  '${widget.courseName.toString()} - ${widget.sectionName}',
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
                        widget.description.toString(),
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
                      onPressed: () {
                        if (widget.isLastIndex) {
                          showDialog(
                            context: context,
                            builder: (context) => ReviewDialog(
                              courseId: widget.courseId.toString(),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            FadeAnimation(
                              page: ModuleListScreen(
                                  courseId: widget.courseId,
                                  courseName: widget.courseName),
                            ),
                          );
                        }
                      },
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
    );
  }
}
