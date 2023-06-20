import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/views/screen/post_feed/post_feed_view_model.dart';

import '../../../utils/color/color.dart';

class CreatePostScreen extends StatefulWidget {
  final Function(String) onPostSubmitted;

  const CreatePostScreen({Key? key, required this.onPostSubmitted})
      : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController postContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
        title: Text(
          "Buat Postingan",
          style: GoogleFonts.poppins(
            color: blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              widget.onPostSubmitted(postContentController.text);
              Navigator.pop(context);
              final provider =
                  Provider.of<PostFeedViewModel>(context, listen: false);
              provider.getAllPostFeed();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: postContentController,
              decoration: const InputDecoration(
                hintText: "Ceritakan pengalamanmu",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
