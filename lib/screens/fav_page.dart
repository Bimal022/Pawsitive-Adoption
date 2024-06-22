import 'package:flutter/material.dart';
import 'package:pet_adoption_app/theme/color.dart';
import 'package:pet_adoption_app/widgets/custom_image.dart';
import 'package:pet_adoption_app/utils/data.dart';
import 'details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    // Filter favorited pets from the pets list
    List<dynamic> favoritedPets =
        pets.where((pet) => pet['is_favorited']).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: const Text(
          'Favorite Pets',
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 20,
          ),
        ),
      ),
      body: favoritedPets.isEmpty
          ? Center(
              child: Text(
                'Add pets to favorites',
                style: TextStyle(fontSize: 18),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: favoritedPets.asMap().entries.map((entry) {
                  int index = entry.key;
                  dynamic pet = entry.value;
                  String petName = pet['name'] ?? '';
                  String petLocation = pet['location'] ?? '';
                  String petImage = pet['image'] ?? '';
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: SizedBox(
                        width: 100, // Adjust width as needed
                        height: 200, // Adjust height as needed
                        child: CustomImage(
                          petImage,
                          borderRadius: BorderRadius.circular(10),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(petName),
                      subtitle: Text(petLocation),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: AppColor.red,
                        ),
                        onPressed: () {},
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(petData: pet),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
