import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/course/module/module_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ModuleVideoScreen extends StatefulWidget {
  static const String routeName = "/modulevideo";
  const ModuleVideoScreen({super.key});

  @override
  State<ModuleVideoScreen> createState() => _ModuleVideoScreenState();
}

class _ModuleVideoScreenState extends State<ModuleVideoScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "ScMzIvxBSi4",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final args = ModalRoute.of(context)!.settings.arguments
        as ModuleDetailVideoArguments;

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
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
              _controller.metadata.title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) => Scaffold(
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
            player,
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                '${args.courseName} - ${args.sectionName}',
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
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  'testing description : Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent arcu enim, pretium in justo et, fringilla sagittis dui. Cras mauris nibh, pretium ut dignissim id, iaculis consequat ligula. Nulla non pulvinar turpis, id maximus nisl. Ut condimentum enim ligula. Morbi dui erat, laoreet sodales feugiat eu, lobortis fringilla massa. Nam pretium arcu quis eros volutpat interdum. Proin hendrerit tellus non arcu sollicitudin, at sollicitudin nibh imperdiet. Aliquam semper feugiat nisl et ultrices. Mauris consequat elementum lectus, sed sollicitudin ipsum. Aenean consequat tellus vel sapien facilisis, non venenatis velit laoreet. Etiam non venenatis ante. Vivamus vel quam iaculis diam consectetur molestie et in nulla. Aenean ultrices, ex sit amet dignissim interdum, libero augue commodo urna, tincidunt mattis eros magna sed turpis. Vestibulum aliquet nibh massa, a auctor arcu tristique in. Integer imperdiet vestibulum lacus quis tristique. Quisque scelerisque nisi convallis enim hendrerit consectetur.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
