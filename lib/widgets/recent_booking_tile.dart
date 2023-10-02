import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class RecentBookingTile extends StatelessWidget {
  const RecentBookingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .10,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.yellow,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hotel Paragon',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      '5000',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color:  AppColor.textSecondary,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text('Rahul',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color:  AppColor.textSecondary,
                              overflow: TextOverflow.ellipsis)),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Row(
                  children: [
                    Icon(
                      LineAwesome.calendar_check,
                      size: 14,
                      color:  AppColor.textSecondary,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '10-20-30',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color:  AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
