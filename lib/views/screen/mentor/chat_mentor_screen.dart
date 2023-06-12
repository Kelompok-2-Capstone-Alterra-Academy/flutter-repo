import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/screen/mentor/search_chat_screen.dart';
import 'package:staredu/views/view_model/mentor/mentor_view_model.dart';

import '../../../utils/animation/fade_animation2.dart';
import '../../../utils/color/color.dart';
import '../../../utils/state/my_state.dart';
import '../../../widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class ChatMentorScreen extends StatefulWidget {
  static const String routeName = "/chat_mentor";
  const ChatMentorScreen({super.key});

  @override
  State<ChatMentorScreen> createState() => _ChatMentorScreenState();
}

class _ChatMentorScreenState extends State<ChatMentorScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        final provider = Provider.of<MentorViewModel>(context, listen: false);

        provider.getAllMentor();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chat",
            style: GoogleFonts.poppins(
                fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
          ),
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: blackColor),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, FadeAnimation2(page: const SearchChatScreen()));
              },
              icon: const Icon(Icons.search_rounded),
              splashRadius: 18,
            ),
          ],
        ),
        body: Consumer<MentorViewModel>(builder: (context, value, _) {
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
            return ListView.builder(
              itemCount: value.mentorList.length,
              itemBuilder: (context, index) => ListTile(
                leading: Image.asset(value.mentorList[index].pic!),
                title: Text(
                  value.mentorList[index].name!,
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w600),
                ),
                subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: subjectColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      value.mentorList[index].subject!,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
                trailing: SizedBox(
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset('assets/images/whatsapp_icon.png'),
                  ),
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
        bottomNavigationBar: const BottomNavigationBarComponent());
  }
}
