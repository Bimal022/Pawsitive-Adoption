import 'package:flutter/material.dart';
import 'package:pet_adoption_app/theme/color.dart';
import 'package:pet_adoption_app/utils/data.dart';
import 'package:pet_adoption_app/widgets/category_item.dart';
import 'package:pet_adoption_app/widgets/notification_box.dart';
import 'package:pet_adoption_app/widgets/pet_item.dart';
import 'details_page.dart';
import 'package:pet_adoption_app/widgets/custom_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  TextEditingController _searchController = TextEditingController();
  List<dynamic> searchedPets = []; // Define searchedPets list

  List<dynamic> searchPetsByName(String query) {
    return pets.where((pet) => pet['name'].toLowerCase().contains(query.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _buildAppBar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildBody(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    color: AppColor.labelColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                      color: AppColor.labelColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Delhi, India",
                // Display latitude and longitude
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        NotificationBox(
          notifiedNumber: 1,
          onTap: null,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              controller: _searchController,
              onChanged: (value) {
                // Implement search here if needed
              },
              onSearch: (query) {
                setState(() {
                  searchedPets = searchPetsByName(query);
                });
              },
            ),
            const SizedBox(
              height: 25,
            ),
            _buildCategories(),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
              child: Text(
                "Adopt Me",
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            _buildPets(),
          ],
        ),
      ),
    );
  }

  int _selectedCategory = 0;

  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildPets() {
    List<dynamic> petsToDisplay = searchedPets.isNotEmpty ? searchedPets : pets; // Use searchedPets if available
    double width = MediaQuery.of(context).size.width * .8;
    return Container(
      height: 400,
      child: PageView.builder(
        itemCount: petsToDisplay.length,
        controller: PageController(viewportFraction: 0.8),
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return PetItem(
            data: petsToDisplay[index],
            width: width,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(petData: petsToDisplay[index]),
                ),
              );
            },
            onFavoriteTap: () {
              setState(() {
                petsToDisplay[index]["is_favorited"] = !petsToDisplay[index]["is_favorited"];
              });
            },
          );
        },
      ),
    );
  }
}
