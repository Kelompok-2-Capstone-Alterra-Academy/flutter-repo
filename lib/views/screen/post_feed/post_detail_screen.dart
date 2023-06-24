import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/models/post_feed_model.dart';
import 'package:staredu/models/user_model.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/post_feed/post_feed_view_model.dart';
import 'package:staredu/utils/constant/list_post_feed.dart';
import 'package:staredu/utils/preferences/preferences_utils.dart';

import '../../../models/reply_model.dart';

class PostDetailScreen extends StatefulWidget {
  final int index;
  const PostDetailScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  List<PostFeedModel> postFeedScreenList = postFeedsList;
  List<PostFeedModel> postRepliesList = [];
  final TextEditingController replyController = TextEditingController();
  User? user;
  String? email;
  late PreferencesUtils preferencesUtils;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      email = preferencesUtils.getPreferencesString('email');
    });
    String? token = preferencesUtils.getPreferencesString('token');
    final provider = Provider.of<PostFeedViewModel>(context, listen: false);
    provider.getUserDetail(email, token);
    provider.getAllPostFeed();
  }

  @override
  void dispose() {
    replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Post",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<PostFeedViewModel>(builder: (context, value, _) {
        user = value.response;
        List<ReplyModel> postRepliesList = value.postRepliesList;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postFeedScreenList[widget.index].name!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        postFeedScreenList[widget.index].time!,
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
                postFeedScreenList[widget.index].comment!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1.0),
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: postFeedScreenList[widget.index].isLiked
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        onPressed: () {
                          context
                              .read<PostFeedViewModel>()
                              .toggleLikeStatus(widget.index);
                          // setState(() {
                          //   postFeedScreenList[widget.index].isLiked =
                          //       !postFeedScreenList[widget.index].isLiked;
                          // });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        (postFeedScreenList[widget.index].like! +
                                (postFeedScreenList[widget.index].isLiked
                                    ? 1
                                    : 0))
                            .toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.comment_outlined,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        postFeedScreenList[widget.index].reply!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Balas',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: postRepliesList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                postRepliesList[index].name,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                postRepliesList[index].time,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                postRepliesList[index].comment,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TextFormField(
                        controller: replyController,
                        decoration: const InputDecoration(
                          hintText: 'Tulis balasan...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ReplyModel newReply = ReplyModel(
                        name: user?.name ?? '',
                        time: "June 23, 2023",
                        comment: replyController.text,
                      );

                      Provider.of<PostFeedViewModel>(context, listen: false)
                          .addReply(newReply);

                      replyController.clear();
                    },
                    icon: const Icon(Icons.send),
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
