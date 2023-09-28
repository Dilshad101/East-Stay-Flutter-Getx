import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      this.icon,
      this.controller,
      this.isReadOnly = false,
      this.onTap,
      this.keyboard,
      this.maxLines,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.action,
      this.hint});
  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboard;
  final TextInputAction? action;
  final int? maxLines;
  final FormFieldValidator<String?>? validator;
  final Function(String?)? onSaved;
  final bool isPassword;
  final String? hint;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: widget.action ?? TextInputAction.done,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboard,
        obscureText: widget.isPassword ? !isObscure : F,
        readOnly: widget.onTap == null ? F : T,
        onTap: widget.onTap,
        validator: widget.validator,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          isDense: true,
          label: Text(widget.label),
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          border: const OutlineInputBorder(),
          prefixIcon: widget.icon != null ? Icon(widget.icon, size: 22) : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          constraints: widget.maxLines == null
              ? const BoxConstraints(maxHeight: 70, minHeight: 35)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() => isObscure = !isObscure);
                  },
                  icon: Icon(
                    isObscure
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.black54,
                    size: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
