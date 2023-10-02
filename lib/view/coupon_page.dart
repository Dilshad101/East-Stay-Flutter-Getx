// ignore_for_file: must_be_immutable

import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view_model/coupon_controller.dart';
import 'package:east_stay_vendor/widgets/custom_text_field.dart';
import 'package:east_stay_vendor/widgets/primary_button.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/coupon_card.dart';

class ScreenCoupon extends StatelessWidget {
  ScreenCoupon({super.key});
  DateTime? _selectedDate;
  final _initialDateController = TextEditingController();
  final _lastDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.put(CouponController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: const Text('Coupons'),
        actions: [
          IconButton(
              onPressed: () {
                getbottomsheet(context);
              },
              icon: const Icon(Icons.add, color: Colors.black)),
          const SizedBox(width: 10)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: const [
          CouponCard(),
          SizedBox(height: 10),
          CouponCard(),
        ],
      ),
    );
  }

  getbottomsheet(BuildContext context) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor:  AppColor.backgroundColor,
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(title: 'Add Coupon'),
            const SizedBox(height: 20),
            const CustomTextField(label: 'Coupon Code', icon: Icons.sell),
            const SizedBox(height: 15),
            const CustomTextField(
              label: 'Discount Amount',
              icon: Icons.currency_rupee_sharp,
              keyboard: TextInputType.number,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  label: 'From',
                  icon: Icons.calendar_today_outlined,
                  onTap: () {
                    setDate(context, _initialDateController);
                  },
                  controller: _initialDateController,
                )),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomTextField(
                    label: 'To',
                    icon: Icons.calendar_today_outlined,
                    onTap: () {
                      setDate(context, _lastDateController);
                    },
                    controller: _lastDateController,
                  ),
                )
              ],
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () {
                Get.back();
              },
              label: 'Done',
            )
          ],
        ),
      ),
    );
  }

  setDate(BuildContext context, TextEditingController controller) async {
    _selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    controller.text =
        Get.find<CouponController>().getFromatedDate(_selectedDate);
  }
}
