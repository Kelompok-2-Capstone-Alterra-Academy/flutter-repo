// Import the necessary packages
import 'package:flutter/material.dart';

// Define a slide animation
class SlideAnimation extends PageRouteBuilder {
  final Widget page;

  SlideAnimation({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
        );
}
