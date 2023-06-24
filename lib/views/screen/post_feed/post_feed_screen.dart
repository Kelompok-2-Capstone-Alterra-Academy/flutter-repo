import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/models/post_feed_model.dart';
import 'package:staredu/utils/animation/slide_animation3.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/post_feed/post_detail_screen.dart';
import 'package:staredu/views/screen/post_feed/post_feed_view_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/constant/list_post_feed.dart';
import '../../../utils/preferences/preferences_utils.dart';
import 'create_post_feed_screen.dart';

class PostFeedScreen extends StatefulWidget {
  const PostFeedScreen({Key? key}) : super(key: key);
  static const routeName = '/postfeed';

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
  List<PostFeedModel> postFeedScreenList = postFeedsList;
  User? user;
  String? email;
  late PreferencesUtils preferencesUtils;

  @override
  void initState() {
    super.initState();
    preferencesUtils = PreferencesUtils();
    preferencesUtils.init();
    setState(() {
      email = preferencesUtils.getPreferencesString('email');
    });
    String? token = preferencesUtils.getPreferencesString('token');
    Future.delayed(
      Duration.zero,
      () {
        final provider = Provider.of<PostFeedViewModel>(context, listen: false);

        provider.getUserDetail(email, token);
        provider.getAllPostFeed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
        title: Text(
          "Aktifitas Pengguna",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<PostFeedViewModel>(builder: (context, value, _) {
        user = value.response;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: searchBarTextColor,
                    child: Icon(
                      Icons.person,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideAnimation3(
                            page: CreatePostScreen(
                              onPostSubmitted: _handlePostSubmitted,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: whiteColor,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ceritakan pengalamanmu",
                              style: GoogleFonts.poppins(
                                color: searchBarTextColor,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: postFeedScreenList.length,
                  itemBuilder: (context, index) {
                    final postFeed = postFeedScreenList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailScreen(
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: searchBarTextColor,
                                    child: Icon(
                                      Icons.person,
                                      color: whiteColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        postFeed.name!,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        postFeed.time!,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                postFeed.comment!,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: postFeed.isLiked
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      value.toggleLikeStatus(index);
                                    },
                                  ),
                                  Text(
                                    (postFeed.like! +
                                            (postFeed.isLiked ? 1 : 0))
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                    icon: const Icon(Icons.comment_outlined),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    postFeed.reply!,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _handlePostSubmitted(String postContent) {
    PostFeedModel newPost = PostFeedModel(
      name: user?.name ?? '',
      time: '20 Juni 2023, 12:37',
      comment: postContent,
      like: 0,
      reply: "0",
      isLiked: false,
    );

    postFeedScreenList.insert(0, newPost);
  }
}
