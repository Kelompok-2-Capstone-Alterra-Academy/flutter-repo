import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staredu/utils/color/color.dart';
import '../../../models/schedule_model.dart';
import '../../../utils/constant/list_schedule_course.dart';
import '../../../widgets/card_button.dart';

class ScheduleCourseScreen extends StatefulWidget {
  static const routeName = '/schedule';

  const ScheduleCourseScreen({super.key});
  @override
  _ScheduleCourseScreenState createState() => _ScheduleCourseScreenState();
}

class _ScheduleCourseScreenState extends State<ScheduleCourseScreen> {
  String selectedFilter = 'Semua';
  List<ScheduleCourseModel> filteredList = scheduleList;

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;

      if (filter == 'Semua') {
        filteredList = scheduleList;
      } else {
        filteredList = scheduleList
            .where((schedule) => schedule.status == filter)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 55),
              Text(
                "Jadwal Pertemuan Kelas",
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScheduleFilterButton(
                  text: 'Semua',
                  onPressed: () => applyFilter('Semua'),
                  isSelected: selectedFilter == 'Semua',
                ),
                ScheduleFilterButton(
                  text: 'Sudah Ikut',
                  onPressed: () => applyFilter('Sudah Ikut'),
                  isSelected: selectedFilter == 'Sudah Ikut',
                ),
                ScheduleFilterButton(
                  text: 'Belum Ikut',
                  onPressed: () => applyFilter('Belum Ikut'),
                  isSelected: selectedFilter == 'Belum Ikut',
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  ScheduleCourseModel schedule = filteredList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        schedule.date,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 12),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            schedule.course,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 6),
                        decoration: BoxDecoration(
                          color: schedule.status == 'Sudah Ikut'
                              ? Colors.green
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          schedule.status,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
