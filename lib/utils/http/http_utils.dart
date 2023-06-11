import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

String getFileNameFromUrl(String url) {
  final uri = Uri.parse(url);
  return uri.pathSegments.last;
}

Future<String> getFileType(String url) async {
  try {
    final response = await http.head(Uri.parse(url));
    final contentType = response.headers['content-type'];

    if (contentType != null) {
      return contentType.split('/').last;
    }
  } catch (e) {
    print('Error checking file type: $e');
  }

  return '';
}

Future<int> getFileSize(String url) async {
  try {
    final response = await http.head(Uri.parse(url));
    final contentLength = response.headers['content-length'];
    if (contentLength != null) {
      final fileSizeInBytes = int.parse(contentLength);
      final fileSizeInKB = fileSizeInBytes / 1024;
      return fileSizeInKB.toInt();
    }
  } catch (e) {
    print('Error getting file size: $e');
  }
  return 0;
}

Future<void> downloadFile(String url, String fileName) async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  var path = "storage/emulated/0/Download/$fileName";
  var file = File(path);
  var result = await http.get(Uri.parse(url));

  file.writeAsBytes(result.bodyBytes);
}
