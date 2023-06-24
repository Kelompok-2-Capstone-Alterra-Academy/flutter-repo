import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/constant/list_post_feed.dart';
import 'package:staredu/views/screen/post_feed/post_feed_view_model.dart';

import '../../models/post_feed_model.dart';
import '../../utils/color/color.dart';
import '../../utils/preferences/preferences_utils.dart';
import '../../views/screen/post_feed/post_detail_screen.dart';

class PostFeed extends StatefulWidget {
  final int index;

  const PostFeed({
    super.key,
    required this.index,
    required this.postFeeds,
  });

  final List<PostFeedModel> postFeeds;

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  List<PostFeedModel> postFeedScreenList = postFeedsList;

  @override
  Widget build(BuildContext context) {
    PostFeedModel postFeed = widget.postFeeds[0];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(
              index: widget.index,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postFeed.name ?? '',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        postFeed.time ?? '',
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
                postFeed.comment ?? '',
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
                      color: postFeedScreenList[widget.index].isLiked
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<PostFeedViewModel>().toggleLikeStatus(0);
                    },
                  ),
                  Text(
                    postFeed.like.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(Icons.comment_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailScreen(
                            index: widget.index,
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    postFeed.reply ?? '',
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
  }
}
