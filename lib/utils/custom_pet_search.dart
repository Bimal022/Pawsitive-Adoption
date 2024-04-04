import 'package:flutter/material.dart';

class CustomPetSearch extends StatefulWidget {
  final List<Pet> allPets;
  final Function(List<Pet>) onSearch;

  const CustomPetSearch({
    Key? key,
    required this.allPets,
    required this.onSearch,
  }) : super(key: key);

  @override
  _CustomPetSearchState createState() => _CustomPetSearchState();
}

class _CustomPetSearchState extends State<CustomPetSearch> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    List<Pet> filteredPets = widget.allPets.where((pet) {
      return pet.name.toLowerCase().contains(query) ||
          pet.location.toLowerCase().contains(query);
    }).toList();
    widget.onSearch(filteredPets);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class Pet {
  final String name;
  final String location;

  Pet({required this.name, required this.location});
}
