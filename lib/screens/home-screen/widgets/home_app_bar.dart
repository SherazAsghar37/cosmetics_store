import 'package:cosmetics_store/utils/assets.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:cosmetics_store/widgets/rounded_image.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.13,
      child: Row(
        spacing: 60,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Search the your best product",
              style: TextStyle(
                fontFamily: 'Leotaro',
                fontSize: 30,
                color: Colours.primaryTextColor,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedImage(
                source: Assets.profilePicture,
                padding: EdgeInsets.all(10),
                borderRadius: 18,
                width: 45,
              ),
              RoundedImage(
                source: Assets.searchIcon,
                type: ImageSourceType.svg,
                padding: EdgeInsets.all(13),
                borderRadius: 16,
                width: 45,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
