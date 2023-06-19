import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:staredu/models/certificate_model.dart';
import 'package:staredu/models/service/certificate_api.dart';
import 'package:staredu/models/service/module_api.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/utils/state/my_state.dart';

class CertificateViewModel with ChangeNotifier {
  List<CourseCertificateModel> _moduleCertificate = [];
  List<CourseCertificateModel> get moduleCertificate => _moduleCertificate;

  late String? _linkPdf;
  String? get getLinkPdf => _linkPdf;
  set setLinkPdf(String link) {
    _linkPdf = link;
  }

  final CertificateApi certificateApi = CertificateApi();

  MyState myState = MyState.initial;

  Future getCertificate() async {
    myState = MyState.loading;

    try {
      _moduleCertificate = await certificateApi.getCertificate();
      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      myState = MyState.failed;
    }
  }

  Future<void> downloadFile() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    var path = "storage/emulated/0/Download/testdummywithdummyapi.pdf";
    var file = File(path);
    var result = await get(Uri.parse(_linkPdf.toString()));
    file.writeAsBytes(result.bodyBytes);
  }
}
