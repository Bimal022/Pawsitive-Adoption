import 'package:flutter/material.dart';
import 'package:pawsitive_adoption/theme/color.dart';
import 'package:pawsitive_adoption/widgets/favorite_box.dart';

import 'custom_image.dart';

class PetItem extends StatelessWidget {
  const PetItem({
    Key? key,
    required this.data,
    this.width = 350,
    this.height = 400,
    this.radius = 40,
    this.onTap,
    this.onFavoriteTap,
  }) : super(key: key);

  final data;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            _buildImage(),
            Positioned(
              bottom: 0,
              child: _buildInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      width: width,
      height: 110,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameAndFavorite(),
          SizedBox(height: 5),
          _buildLocation(),
          SizedBox(height: 15),
          _buildAttributes(),
        ],
      ),
    );
  }

  Widget _buildNameAndFavorite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        FavoriteBox(
          isFavorited: data["is_favorited"],
          onTap: onFavoriteTap,
        ),
      ],
    );
  }

  Widget _buildLocation() {
    return Text(
      data["location"],
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColor.glassLabelColor,
        fontSize: 13,
      ),
    );
  }

  Widget _buildImage() {
    return CustomImage(
      data["image"],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius),
        bottom: Radius.zero,
      ),
      isShadow: false,
      width: width,
      height: 350,
    );
  }

  Widget _buildAttributes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getAttribute(
          Icons.transgender,
          data["sex"],
        ),
        _getAttribute(
          Icons.color_lens_outlined,
          data["color"],
        ),
        _getAttribute(
          Icons.query_builder,
          data["age"],
        ),
      ],
    );
  }

  Widget _getAttribute(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColor.textColor, fontSize: 13),
        ),
      ],
    );
  }
}
