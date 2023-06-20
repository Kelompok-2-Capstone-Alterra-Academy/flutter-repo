import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/view_model/mentor/mentor_view_model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/preferences/preferences_utils.dart';
import '../../../utils/state/my_state.dart';
import '../../../widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class SearchChatScreen extends StatefulWidget {
  static const String routeName = "/search_chat";
  const SearchChatScreen({super.key});

  @override
  State<SearchChatScreen> createState() => _SearchChatScreenState();
}

class _SearchChatScreenState extends State<SearchChatScreen> {
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
    final provider = Provider.of<MentorViewModel>(context, listen: false);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cari Mentor",
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
            child: Container(
              height: 42,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: searchBarColor,
              ),
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 11,
                ),
                cursorColor: greyColor,
                onChanged: (value) => provider.searchMentor(value),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Cari Nama Mentor",
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: searchBarTextColor,
                  ),
                  hintStyle: GoogleFonts.poppins(
                    color: searchBarTextColor,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Consumer<MentorViewModel>(builder: (context, value, _) {
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
              return Flexible(
                child: value.findMentor.isNotEmpty
                    ? ListView.builder(
                        itemCount: value.findMentor.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: Image.asset(
                            value.mentorList[index].profile!
                                        .contains('noimage') ||
                                    value.mentorList[index].profile!.length >
                                        20 ||
                                    value.mentorList[index].profile!.isEmpty
                                ? "assets/images/mentor_pic.png"
                                : "assets/images/${value.mentorList[index].profile!}",
                          ),
                          title: Text(
                            value.findMentor[index].name!,
                            style: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                color: subjectColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                value.findMentor[index].mentorModelClass!,
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
                              onTap: () {
                                value.launchWhatsapp(
                                  context,
                                  value.mentorList[index].phoneNumber!.isEmpty
                                      ? "0895848484848"
                                      : value.mentorList[index].phoneNumber!,
                                );
                              },
                              child: Image.asset(
                                  'assets/images/whatsapp_icon.png'),
                            ),
                          ),
                        ),
                      )
                    : Text(
                        'No results found',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w600),
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBarComponent(),
    );
  }
}
