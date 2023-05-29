import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/notification/notification_view_model.dart';
import 'package:staredu/widgets/notification/notification_section.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const routeName = '/notification';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NotificationViewModel>(context, listen: false)
        .getAllNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Notifikasi',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          color: whiteColor,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Consumer<NotificationViewModel>(
              builder: (context, value, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.notificationList.length,
                    itemBuilder: (context, index) {
                      return NotificationSection(
                        id: index,
                        title: value.notificationList[index].title,
                        course: value.notificationList[index].course,
                        description: value.notificationList[index].description,
                        date: value.notificationList[index].date,
                        time: value.notificationList[index].time,
                      );
                    });
              },
            ),
          ]),
        ),
      ),
    );
  }
}
