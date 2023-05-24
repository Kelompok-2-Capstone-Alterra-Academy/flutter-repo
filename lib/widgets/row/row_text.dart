import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String left;
  final String right;
  const RowText({Key? key, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(right, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
