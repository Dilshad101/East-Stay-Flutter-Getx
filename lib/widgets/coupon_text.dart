
import 'package:flutter/material.dart';

class CouponText extends StatelessWidget {
  const CouponText({
    super.key,
    required this.text1,
    required this.text2,
    this.size1,
    this.size2,
    this.isBold = false,
  });
  final String text1;
  final String text2;
  final double? size1;
  final double? size2;
  final bool isBold;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: size1 ?? 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xff3C3B3B),
          ),
        ),
        Text(
          text2,
          style: TextStyle(
              fontSize: size2 ?? 12,
              color: const Color(0xff3C3B3B),
              fontWeight:isBold? FontWeight.bold:FontWeight.w500),
        ),
      ],
    );
  }
}