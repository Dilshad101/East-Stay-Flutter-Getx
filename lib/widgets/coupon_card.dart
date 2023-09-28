
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'coupon_text.dart';

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
                    color: const Color(0xff808080).withOpacity(.38),
                    width: .5),
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
              CouponText(
                text1: 'Coupon code',
                text2: 'STAYFIRST',
                size1: 14,
                size2: 15,
                isBold: true,
              ),
              CouponText(
                text1: 'Discount',
                text2: '400',
                size1: 14,
                size2: 15,
                isBold: true,
              ),
              CouponText(
                text1: 'From',
                text2: '18-9-2023',
              ),
              CouponText(
                text1: 'To',
                text2: '18-12-2023',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

