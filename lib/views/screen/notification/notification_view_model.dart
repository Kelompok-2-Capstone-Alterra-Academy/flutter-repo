import 'package:flutter/material.dart';
import 'package:staredu/models/notif.dart';
import 'package:staredu/models/service/notification_api.dart';

class NotificationViewModel extends ChangeNotifier {
  List<Notif> _notificationList = [];

  List<Notif> get notificationList => _notificationList;

  void getAllNotification() async {
    _notificationList = await NotificationAPI.getAllNotification();
    notifyListeners();
  }
}
