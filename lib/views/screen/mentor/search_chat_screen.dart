import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/constant/mentor_list.dart';

import '../../../models/mentor_model.dart';
import '../../../utils/color/color.dart';

class SearchChatScreen extends StatefulWidget {
  const SearchChatScreen({super.key});

  @override
  State<SearchChatScreen> createState() => _SearchChatScreenState();
}

class _SearchChatScreenState extends State<SearchChatScreen> {
  List<MentorModel> findMentor = [];

  @override
  void initState() {
    findMentor = mentorList;
    super.initState();
  }

  //Fungsi untuk search chat mentor (belum di implementasikan ke provider)
  void searching(String enterKey) {
    List<MentorModel> results = [];
    if (enterKey.isEmpty) {
      results = mentorList;
    } else {
      results = mentorList
          .where((user) =>
              user.name!.toLowerCase().contains(enterKey.toLowerCase()))
          .toList();
    }
    setState(() {
      findMentor = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Mentor",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w600, color: blackColor),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              onChanged: (value) => searching(value),
              decoration: InputDecoration(
                labelText: 'Search Name',
                suffixIcon: const Icon(Icons.search),
                labelStyle: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: findMentor.isNotEmpty
                ? ListView.builder(
                    itemCount: findMentor.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Image.asset(findMentor[index].pic!),
                      title: Text(
                        findMentor[index].name!,
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
                            findMentor[index].subject!,
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
                  )
                : Text(
                    'No results found',
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
          ),
        ],
      ),
    );
  }
}
