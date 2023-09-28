import 'package:flutter/material.dart';

class CustomSettingsTile extends StatelessWidget {
  const CustomSettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
    this.removeArrow = false,
  });
  final String title;
  final IconData icon;
  final VoidCallback ontap;
  final bool removeArrow;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black87,
        size: 28,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      trailing: removeArrow
          ? null
          : const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
      onTap: ontap,
    );
  }
}
