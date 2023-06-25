import 'package:staredu/models/certificate_model.dart';

class CertificateApi {
  Future<List<CourseCertificateModel>> getCertificate() async {
    // final response = await Dio().get();

    // return response
    //     .then((value) => value.data)
    //     .catchError((e) => handleErrorApi(e));
    final List<CourseCertificateModel> data = [
      CourseCertificateModel(
        link: 'https://web.wpi.edu/Images/CMS/Provost/landscape.pdf',
        id: 1,
        courseId: 1,
      ),
    ];
    return data;
  }
}
