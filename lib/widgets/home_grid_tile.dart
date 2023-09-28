
import 'package:flutter/material.dart';

class HomeGridTile extends StatelessWidget {
  const HomeGridTile({
    super.key,
    required this.icons,
    required this.titles,
    required this.index,
  });

  final List<IconData> icons;
  final List<String> titles;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffFFE1E1),
            child: Icon(
              icons[index],
              color: Colors.black.withOpacity(.8),
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titles[index],
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff232323)),
              ),
              const Text(
                'data',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff232323)),
              )
            ],
          )
        ],
      ),
    );
  }
}
