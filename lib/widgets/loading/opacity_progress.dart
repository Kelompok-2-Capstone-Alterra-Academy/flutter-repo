import 'package:flutter/material.dart';
import 'package:staredu/utils/color/color.dart';

class OpacityProgressComponent extends StatelessWidget {
  const OpacityProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.8,
      child: ModalBarrier(
        dismissible: false,
        color: whiteColor,
      ),
    );
  }
}
