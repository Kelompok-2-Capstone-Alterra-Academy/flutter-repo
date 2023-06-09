import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/animation/fade_animation.dart';
import 'package:staredu/utils/animation/fade_animation2.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';
import 'package:staredu/views/screen/course/module/module_list_screen.dart';
import 'package:staredu/views/screen/mentor/chat_mentor_screen.dart';
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
  final int? moduleId;
  final bool? isFinished;

  const ModuleVideoScreen(
      {super.key,
      this.courseId,
      this.sectionId,
      this.courseName,
      this.sectionName,
      this.moduleName,
      this.linkModule,
      this.description,
      required this.isLastIndex,
      this.moduleId,
      this.isFinished});

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

  Future<void> saveSectionProgress() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    //get current user
    String email = preferencesUtils.getPreferencesString("user_email") ?? "";
    //get current section
    int currentSection = preferencesUtils.getPreferencesInt(
            'current_section_course_${widget.courseId}_$email') ??
        0;
    //increment the current section value
    await preferencesUtils.savePreferencesInt(
      'current_section_course_${widget.courseId}_$email',
      currentSection + 1,
    );
  }

  Future<void> updateModuleStatus() async {
    PreferencesUtils preferencesUtils = PreferencesUtils();
    String email = preferencesUtils.getPreferencesString("user_email") ?? "";

    await preferencesUtils.init();

    await preferencesUtils.savePreferencesBool(
        "${widget.moduleId.toString()}_$email", true);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
                    child: widget.isFinished!
                        ? OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: searchBarTextColor,
                              backgroundColor: searchBarColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: null,
                            child: Text(
                              "Selesai",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          )
                        : OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: whiteColor,
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              if (widget.isLastIndex) {
                                await saveSectionProgress();
                                await updateModuleStatus();
                                if (context.mounted) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => ReviewDialog(
                                      courseId: widget.courseId!,
                                    ),
                                  );
                                }
                              } else {
                                await saveSectionProgress();
                                await updateModuleStatus();
                                if (context.mounted) {
                                  Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                    FadeAnimation(
                                      page: ModuleListScreen(
                                        courseId: widget.courseId,
                                        courseName: widget.courseName,
                                        courseFinished: false,
                                      ),
                                    ),
                                  );
                                }
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
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            FadeAnimation2(
                              page: const ChatMentorScreen(),
                            ),
                            (route) => false);
                      },
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
