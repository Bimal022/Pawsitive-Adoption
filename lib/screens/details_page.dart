import 'package:flutter/material.dart';
import 'package:pet_adoption_app/theme/color.dart';
import 'package:pet_adoption_app/widgets/favorite_box.dart';
import 'package:pet_adoption_app/widgets/custom_image.dart';
import 'package:pet_adoption_app/utils/data.dart';

class DetailsPage extends StatefulWidget {
  final dynamic petData;

  const DetailsPage({Key? key, required this.petData}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(
          'Pet Details',
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet Image
            CustomImage(
              widget.petData['image'],
              width: double.infinity,
              height: 200,
              borderRadius: BorderRadius.circular(10),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Pet Name
            Text(
              widget.petData['name'],
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Pet Details
            Text(
              'Age: ${widget.petData['age']}',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Color: ${widget.petData['color']}',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sex: ${widget.petData['sex']}',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Location: ${widget.petData['location']}',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            // Pet Description
            Text(
              'Description:',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.petData['description'],
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),

            SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.red,
                  ),
                  onPressed: () {},
                  child: Icon(Icons.shopping_cart), // Use shopping cart icon
                ),
                FavoriteBox(
                  isFavorited: widget.petData["is_favorited"],
                  onTap: () {
                    setState(() {
                      widget.petData["is_favorited"] =
                          !widget.petData["is_favorited"];
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
