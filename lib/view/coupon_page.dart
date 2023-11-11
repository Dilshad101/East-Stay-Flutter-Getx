import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view_model/coupon_controller.dart';
import 'package:east_stay_vendor/view_model/vendor_controller.dart';
import 'package:east_stay_vendor/widgets/custom_text_field.dart';
import 'package:east_stay_vendor/widgets/primary_button.dart';
import 'package:east_stay_vendor/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/coupon_card.dart';

class ScreenCoupon extends StatelessWidget {
  ScreenCoupon({super.key});

  final couponController = Get.put(CouponController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
          ),
          title: const Text('Coupons'),
          actions: [
            IconButton(
                onPressed: () => getbottomsheet(context),
                icon: const Icon(Icons.add, color: Colors.black)),
            const SizedBox(width: 10)
          ],
        ),
        body: GetBuilder<VendorController>(
          builder: (controller) => controller.couponList.isEmpty
              ? const Center(
                  child: Text(
                    "you don't have any coupons",
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: .5,
                    ),
                  ),
                )
              : ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  physics: const ScrollPhysics(),
                  itemCount: controller.couponList.length,
                  itemBuilder: (context, index) {
                    final coupon = controller.couponList[index];
                    return CouponCard(coupon: coupon);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10)),
        ));
  }

  getbottomsheet(BuildContext context) {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.backgroundColor,
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        // height: 380,
        child: Form(
          key: couponController.couponKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const TitleText(title: 'Add Coupon'),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Coupon Code',
                icon: Icons.sell,
                controller: couponController.codeController,
                validator: (value) => couponController.isEmpty(value!),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                label: 'Discount Amount',
                icon: Icons.currency_rupee_sharp,
                keyboard: TextInputType.number,
                controller: couponController.discountController,
                validator: (value) => couponController.isNumber(value!),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    label: 'From',
                    icon: Icons.calendar_today_outlined,
                    onTap: () => couponController.setDate(context, true),
                    controller: couponController.startDateController,
                    validator: (value) => couponController.isDateEmpty(true),
                  )),
                  const SizedBox(width: 15),
                  Expanded(
                    child: CustomTextField(
                      label: 'To',
                      icon: Icons.calendar_today_outlined,
                      onTap: () => couponController.setDate(context, false),
                      controller: couponController.endDateController,
                      validator: (value) => couponController.isDateEmpty(false),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                onPressed: () {
                  couponController.addToCouponList();
                },
                label: 'Create Coupon',
              )
            ],
          ),
        ),
      ),
    );
  }
}
