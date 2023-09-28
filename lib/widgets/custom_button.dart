import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isTextButton = false,
    this.textcolor,
  });
  final String label;
  final VoidCallback onPressed;
  final bool isTextButton;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isTextButton ? Colors.white : Colors.black87),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side:
                  BorderSide(color: isTextButton ? Colors.grey : Colors.white),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: isTextButton ? 12 : 14,
            color: isTextButton ?textcolor?? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
