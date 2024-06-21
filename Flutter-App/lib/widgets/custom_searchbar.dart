import 'package:flutter/material.dart';
import 'package:pet_adoption_app/theme/color.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onSubmitted;
  final Function(String) onSearch; // Callback function for search

  CustomSearchBar({
    required this.controller,
    required this.onChanged,
    this.onSubmitted,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 14),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            onChanged(value);
            onSearch(value); // Call the search callback
          },
          onSubmitted: (_) => onSubmitted?.call(),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => onSubmitted?.call(),
            ),
          ),
        ),
      ),
    );
  }
}
