import 'package:flutter/material.dart';

class KeyValueText extends StatelessWidget {
  const KeyValueText({
    super.key,
    required this.text1,
    required this.text2,
    required this.size1,
    required this.size2,
    required this.color1,
    required this.color2,
    this.fontFamily,
    this.fontWeight1,
    this.fontWeight2,
  });
  final String text1;
  final String text2;
  final double size1;
  final double size2;
  final Color color1;
  final Color color2;
  final FontWeight? fontWeight1;
  final FontWeight? fontWeight2;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text1,
            style: TextStyle(
                fontSize: size1,
                fontWeight: fontWeight1 ?? FontWeight.w600,
                color: color1,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: size2,
            fontWeight: fontWeight2 ?? FontWeight.w600,
            color: color2,
            fontFamily: fontFamily ?? 'Poppins',
          ),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
