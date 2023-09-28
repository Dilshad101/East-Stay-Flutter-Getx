
import 'package:flutter/material.dart';

class Amenities extends StatelessWidget {
  const Amenities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff939393), width: .5),
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi, size: 30),
            SizedBox(height: 5),
            Text('Wifi',
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
