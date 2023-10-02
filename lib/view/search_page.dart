import 'package:east_stay_vendor/utils/constents/colors.dart';
import 'package:east_stay_vendor/view_model/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSearch extends StatelessWidget {
   ScreenSearch({super.key});
  final searchController=Get.put(Searchcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: SafeArea(
            child: SearchBar(
              onChanged: (value) {
                searchController.searchRoom(value);
              },
            ),
          )),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.onChanged,
  });
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(50)),
      padding: const EdgeInsets.only(left: 5, right: 10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.textPrimary,
            ),
            onPressed: () => Get.back(),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Search...'),
              onChanged: onChanged,
            ),
          ),
          const Icon(
            Icons.search,
            color: AppColor.textSecondary,
          )
        ],
      ),
    );
  }
}
