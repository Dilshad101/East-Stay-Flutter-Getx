
import 'package:east_stay_vendor/widgets/custom_key_value_text.dart';
import 'package:flutter/material.dart';

class RoomGridTile extends StatelessWidget {
  const RoomGridTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              color: Colors.amber,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              color: Colors.white,
            ),
            child:  const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KeyValueText(
                  text1: 'Hotel Paragon',
                  text2: '₹ 5000',
                  fontFamily: 'Ubuntu',
                  size1: 13,
                  size2: 14,
                  color1: Colors.black87,
                  color2: Color(0xffE55959),
                  fontWeight1: FontWeight.w600,
                  fontWeight2: FontWeight.w600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Color(0xFF616161),
                    ),
                    Expanded(
                      child: Text(
                        'Calicut Kerela',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF616161),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
