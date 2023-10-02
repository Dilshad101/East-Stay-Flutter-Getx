import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/widgets/custom_key_value_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
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
            height: 118,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                    color: const Color(0xff808080).withOpacity(.38), width: .5),
              ),
            ),
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width * .25,
            child: SvgPicture.asset(
              'assets/images/voucher-discount-ecommerce 2.svg',
              fit: BoxFit.none,
            ),
          ),
          const Expanded(
              child: Column(
            children: [
              // CouponText(
              //   text1: 'Coupon code',
              //   text2: 'STAYFIRST',
              //   size1: 14,
              //   size2: 15,
              //   isBold: true,
              // ),
              KeyValueText(
                text1: 'Coupn code',
                text2: 'STAYFIRST',
                size1: 14,
                size2: 15,
                color1: AppColor.textPrimary,
                color2: Colors.black87,
                fontWeight2: FontWeight.bold,
              ),
              // CouponText(
              //   text1: 'Discount',
              //   text2: '400',
              //   size1: 14,
              //   size2: 15,
              //   isBold: true,
              // ),
               KeyValueText(
                text1: 'Discount',
                text2: ' ₹ 400',
                size1: 14,
                size2: 15,
                color1: AppColor.textPrimary,
                color2: Colors.black87,
                fontWeight2: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
              // CouponText(
              //   text1: 'From',
              //   text2: '18-9-2023',
              // ),
               KeyValueText(
                text1: 'From',
                text2: '18-9-2023',
                size1: 12,
                size2: 12,
                color1: AppColor.textPrimary,
                color2: AppColor.textSecondary,
               
              ),
              // CouponText(
              //   text1: 'To',
              //   text2: '18-12-2023',
              // ),
               KeyValueText(
                text1: 'To',
                text2: '18-9-2023',
                size1: 12,
                size2: 12,
                color1: AppColor.textPrimary,
                color2: AppColor.textSecondary,
               
              ),
            ],
          ))
        ],
      ),
    );
  }
}
