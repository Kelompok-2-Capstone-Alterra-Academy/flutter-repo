import 'package:flutter/material.dart';
import 'package:staredu/models/notif.dart';

class NotificationAPI {
  static Future<List<Notif>> getAllNotification() async {
    final List<Notif> data = [
      Notif(
          title: 'Live session - Dasar Bangun Ruang',
          course: 'Matematika',
          description:
              'Hai! Jangan lupa masuk, akan dimulai dalam 30 menit lagi.',
          date: '17 Mei 2023',
          time: '12:00'),
      Notif(
          title: 'Live session - Dasar Penjajah',
          course: 'Sejarah',
          description:
              'Hai! Jangan lupa masuk, akan dimulai dalam 60 menit lagi.',
          date: '17 Mei 2023',
          time: '12:00'),
      Notif(
          title: 'New Course',
          course: 'Flutter',
          description: 'New course has been added',
          date: '12/12/2021',
          time: '12:00'),
      Notif(
          title: 'New Course',
          course: 'Flutter',
          description: 'New course has been added',
          date: '12/12/2021',
          time: '12:00'),
    ];

    return data;
  }
}
