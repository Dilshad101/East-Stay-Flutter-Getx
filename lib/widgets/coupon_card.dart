import 'package:east_stay_vendor/model/coupon_model.dart';
import 'package:east_stay_vendor/utils/colors.dart';
import 'package:east_stay_vendor/view_model/coupon_controller.dart';
import 'package:east_stay_vendor/widgets/custom_key_value_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
    required this.coupon,
  });
  final Coupon coupon;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) =>
                Get.find<CouponController>().deleteCoupon(coupon.id),
            backgroundColor: Colors.red[400]!,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: .5,
            color: const Color(0xff808080).withOpacity(.38),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      color: const Color(0xff808080).withOpacity(.38),
                      width: .5),
                ),
              ),
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width * .20,
              child: Transform.scale(
                scale: .7,
                child: SvgPicture.asset(
                  'assets/images/voucher-discount-ecommerce 2.svg',
                  fit: BoxFit.none,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KeyValueText(
                    text1: 'Coupn code',
                    text2: coupon.couponcode,
                    size1: 14,
                    size2: 14,
                    color1: AppColor.textPrimary,
                    color2: Colors.black87,
                    fontWeight2: FontWeight.bold,
                  ),
                  KeyValueText(
                    text1: 'Discount',
                    text2: ' ₹ ${coupon.discountAmount}',
                    size1: 14,
                    size2: 14,
                    color1: AppColor.textPrimary,
                    color2: Colors.black,
                    fontWeight2: FontWeight.bold,
                    fontFamily: 'Ubuntu',
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'From : ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textPrimary,
                              ),
                            ),
                            TextSpan(
                              text: coupon.fromDate,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'To : ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textPrimary,
                              ),
                            ),
                            TextSpan(
                              text: coupon.toDate,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
