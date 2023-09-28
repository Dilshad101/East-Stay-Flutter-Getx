import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSearch extends StatelessWidget {
   const ScreenSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.sizeOf(context).height -
            MediaQuery.of(context).padding.top,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 5, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Row(
                children: [
                   IconButton(icon:const Icon(Icons.arrow_back),onPressed: ()=>Get.back(),),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Search...'),
                    ),
                  ),
                  
                  const Icon(Icons.search)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
