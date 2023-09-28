
import 'package:flutter/material.dart';

class RoomInfoText extends StatelessWidget {
  const RoomInfoText({
    super.key,
    required this.text1,
    required this.text2,
    this.color,
  });
  final String text1;
  final String text2;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff484848),
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 12,
            fontWeight:FontWeight.w500,
            color: color ?? const Color(0xff747474),
          ),
        )
      ],
    );
  }
}
