
import 'package:east_stay_vendor/utils/colors.dart';
import 'package:flutter/material.dart';

class Dividertext extends StatelessWidget {
  const Dividertext({
    super.key,
    required this.title,
    required this.subtilte,
  });
  final String title;
  final String subtilte;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF757575),
          ),
        ),
        Text(
          subtilte,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColor.textPrimary,
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
