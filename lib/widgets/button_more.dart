
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    this.onSelected,
    required this.text1,
    required this.text2,
    required this.icon1,
    required this.icon2,
  });
  final Function(int)? onSelected;
  final String text1;
  final String text2;
  final IconData icon1;
  final IconData icon2;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      icon: const Icon(Icons.more_vert, color: Colors.black),
      elevation: 1.5,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                icon1,
                size: 18,
                color: Colors.black54,
              ),
              const SizedBox(width: 10),
              Text(text1, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(icon2, size: 18, color: Colors.black54),
              const SizedBox(width: 10),
              Text(text2, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
