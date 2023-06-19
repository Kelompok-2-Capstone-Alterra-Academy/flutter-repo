import 'package:intl/intl.dart';

String convertDateFormat(String originalDate) {
  DateTime date = DateTime.parse(originalDate);
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  return formattedDate;
}
