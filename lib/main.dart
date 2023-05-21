import 'package:flutter/material.dart';
import 'package:staredu/views/screen/history/history_transaction_screen.dart';
import 'package:staredu/views/screen/history/note_transaction_screen.dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HistoryTransactionScreen());
  }
}
