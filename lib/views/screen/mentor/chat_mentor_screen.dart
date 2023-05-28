import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/constant/mentor_list.dart';
import 'package:staredu/views/screen/mentor/search_chat_screen.dart';

import '../../../utils/color/color.dart';

class ChatMentorScreen extends StatefulWidget {
  static const String routeName = "/chat_mentor";
  const ChatMentorScreen({super.key});

  @override
  State<ChatMentorScreen> createState() => _ChatMentorScreenState();
}

class _ChatMentorScreenState extends State<ChatMentorScreen> {
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
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchChatScreen(),
                  ));
            },
            icon: const Icon(Icons.search_rounded),
            splashRadius: 18,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mentorList.length,
        itemBuilder: (context, index) => ListTile(
          leading: Image.asset(mentorList[index].pic!),
          title: Text(
            mentorList[index].name!,
            style:
                GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
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
                mentorList[index].subject!,
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
      ),
    );
  }
}