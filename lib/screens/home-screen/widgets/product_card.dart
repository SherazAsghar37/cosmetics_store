import 'package:cosmetics_store/model/product_model.dart';
import 'package:cosmetics_store/screens/product-details/product_details_screen.dart';
import 'package:cosmetics_store/utils/assets.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:cosmetics_store/utils/curved_rect_tween.dart';
import 'package:cosmetics_store/widgets/app_text.dart';
import 'package:cosmetics_store/widgets/bouncing_button.dart';
import 'package:cosmetics_store/widgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colours.cardBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BouncingButton(
                onPressed:
                    () => Navigator.pushNamed(
                      context,
                      ProductDetailsScreen.routeName,
                      arguments: product,
                    ),
                child: Hero(
                  tag: product.imagePath,
                  createRectTween:
                      (begin, end) => CurveRectTween(
                        begin: begin,
                        end: end,
                        curve: Curves.fastOutSlowIn,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedImage(
                        source: product.imagePath,
                        width: 120,
                        color: Colours.transparentColor,
                      ),
                    ],
                  ),
                ),
              )
              .animate(delay: 700.ms)
              .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 1000.ms,
                curve: Curves.fastOutSlowIn,
              ),
          const SizedBox(height: 15),
          AppText(text: product.name, fontWeight: FontWeight.w500)
              .animate(delay: 750.ms)
              .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 1000.ms,
                curve: Curves.fastOutSlowIn,
              ),
          SizedBox(height: 3),
          AppText(
                text: product.subTitle,
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colours.primaryTextColorLight,
              )
              .animate(delay: 900.ms)
              .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 1000.ms,
                curve: Curves.fastOutSlowIn,
              ),
          SizedBox(height: 5),
          Row(
                children: [
                  AppText(
                    text: "\$${product.price.toStringAsFixed(2)}",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  const Spacer(),
                  RoundedImage(
                    source: Assets.shoppingBagIcon,
                    type: ImageSourceType.svg,
                    width: 30,
                    padding: EdgeInsets.all(2),
                  ),
                ],
              )
              .animate(delay: 700.ms)
              .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn)
              .moveY(
                begin: 30,
                end: 0,
                duration: 1000.ms,
                curve: Curves.fastOutSlowIn,
              ),
        ],
      ),
    );
  }
}
