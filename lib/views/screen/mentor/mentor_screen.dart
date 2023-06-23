import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/view_model/mentor/mentor_view_model.dart';

import '../../../utils/color/color.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../utils/state/my_state.dart';

class MentorScreen extends StatefulWidget {
  static const String routeName = "/mentor";
  const MentorScreen({super.key});

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  late PreferencesUtils preferencesUtils;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    String? token = preferencesUtils.getPreferencesString('token');

    if (context.mounted) {
      Provider.of<MentorViewModel>(context, listen: false).getAllMentor(token!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Mentor",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<MentorViewModel>(builder: (context, value, _) {
          if (value.myState == MyState.loading) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blueAccent[100],
            ));
          } else if (value.myState == MyState.failed) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Oops, Something Went Wrong!',
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    textAlign: TextAlign.center,
                    'Make Sure Internet is Connected.',
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          } else if (value.myState == MyState.success) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: value.mentorList.length,
              itemBuilder: (context, index) => Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                elevation: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 19),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(
                        value.mentorList[index].profile!.contains('noimage') ||
                                value.mentorList[index].profile!.length > 20 ||
                                value.mentorList[index].profile!.isEmpty
                            ? "assets/images/mentor_pic.png"
                            : "assets/images/${value.mentorList[index].profile!}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      value.mentorList[index].name!,
                      style: GoogleFonts.poppins(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 116,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: subjectColor,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Center(
                          child: Text(
                        value.mentorList[index].mentorModelClass!,
                        style: GoogleFonts.poppins(
                            fontSize: 11, fontWeight: FontWeight.w600),
                      )),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
              ),
            );
          }
        }),
      ),
    );
  }
}
