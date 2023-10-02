
import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.label,
    required this.showLoading,
    required this.onPressed,
  });

  final String label;
  final Rx<bool> showLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 48,
      child: Obx(
        () => ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all( AppColor.primaryColor)),
          child: showLoading.value
              ? Transform.scale(
                  scale: .5,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5,
                    strokeCap: StrokeCap.round,
                  ),
                )
              : Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
