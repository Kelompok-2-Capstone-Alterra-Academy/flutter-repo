import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:staredu/utils/color/color.dart';
import 'package:staredu/views/screen/home/home_screen.dart';
import 'package:staredu/views/screen/profile/profile.dart';
import 'package:staredu/widgets/bottom_navigation_bar/bottom_navigation_bar_view_model.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({super.key});

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  @override
  initState() {
    super.initState();
  }

  void changeScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
        break;
      // TODO Add Other Screen
      case 4:
        Navigator.pushNamedAndRemoveUntil(
            context, Profile.routeName, (route) => false);
        break;
      default:
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // give border
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3), // Offset changes the shadow position
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Consumer<BottomNavigationBarComponentViewModel>(
                builder: (context, model, child) {
              return BottomNavigationBar(
                currentIndex: model.currentIndex,
                backgroundColor: whiteColor,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  model.changeIndex(index);
                  changeScreen(index);
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.collections_bookmark),
                    label: 'Kursus',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Transaksi',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Akun',
                  ),
                ],
                selectedItemColor: primaryColor,
              );
            })));
  }
}
