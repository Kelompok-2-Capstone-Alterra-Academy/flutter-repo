import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import '../../../models/course_history_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/preferences/preferences_utils.dart';
import 'history_transaction_view_model.dart';
import 'package:intl/intl.dart';

class NoteTransactionScreen extends StatefulWidget {
  final CourseHistoryModel? model;
  const NoteTransactionScreen({Key? key, required this.model})
      : super(key: key);

  @override
  State<NoteTransactionScreen> createState() => _NoteTransactionScreenState();
}

class _NoteTransactionScreenState extends State<NoteTransactionScreen> {
  late PreferencesUtils preferencesUtils;
  late User? user;
  String? email;
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
    // ignore: use_build_context_synchronously
    Provider.of<HistoryTransactionViewModel>(context, listen: false)
        .getUserDetail(email, token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
        title: Text(
          "Nota Kursus",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<HistoryTransactionViewModel>(
          builder: (context, value, _) {
            user = value.response;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/barcode.png',
                    fit: BoxFit.contain,
                    width: 200,
                    height: 120,
                  ),
                  Text(
                    widget.model!.invoiceNumber!,
                    style: GoogleFonts.poppins(
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.ios_share,
                            color: primaryColor,
                            size: 16,
                          ),
                          label: Text(
                            'Share',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1976D2),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor,
                            side: const BorderSide(color: primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.file_download_outlined,
                            color: primaryColor,
                            size: 16,
                          ),
                          label: Text(
                            'Download',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1976D2),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor,
                            side: const BorderSide(color: primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.local_print_shop_outlined,
                            color: primaryColor,
                            size: 16,
                          ),
                          label: Text(
                            'Print',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1976D2),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor,
                            side: const BorderSide(color: primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 85,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: searchBarColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Kursus',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.model!.transactionDetails![0].course!
                                      .courseName!,
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Kategori',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'SMA/SMK Kelas ${widget.model!.transactionDetails![0].course!.courseClass!.className!} ',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: searchBarColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Nama',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  user?.name ?? '',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Telepone',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  user?.phoneNumber ?? '',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Email',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  user?.email ?? '',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Negara',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Indonesia',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: searchBarColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Harga',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: 'Rp',
                                          decimalDigits: 0)
                                      .format(widget.model!
                                          .transactionDetails![0].price!),
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(height: 20),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Text(
                          //         'Metode Pembayaran',
                          //         style: GoogleFonts.poppins(
                          //           color: blackColor,
                          //           fontSize: 11,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         'Transfer Bank',
                          //         // value.historyCourses[index].pembayaran!,
                          //         style: GoogleFonts.poppins(
                          //           color: blackColor,
                          //           fontSize: 11,
                          //           fontWeight: FontWeight.w700,
                          //         ),
                          //         textAlign: TextAlign.right,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Tanggal',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  DateFormat('dd MMMM yyyy').format(
                                      DateTime.parse(
                                          value.historyCourses[0].createdAt!)),
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'ID Transaksi',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.model!.transactionDetails![0]
                                      .transactionId!
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Status',
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.model!.status!,
                                  style: GoogleFonts.poppins(
                                    color: blackColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
