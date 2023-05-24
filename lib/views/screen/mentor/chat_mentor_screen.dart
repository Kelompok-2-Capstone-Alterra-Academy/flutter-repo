import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/constant/mentor_list.dart';

import '../../../utils/color/color.dart';

class ChatMentorScreen extends StatefulWidget {
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
            onPressed: () {},
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
          subtitle: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(right: 110),
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
