import 'package:cosmetics_store/model/product_model.dart';
import 'package:cosmetics_store/screens/product-details/widgets/star_painter.dart';
import 'package:cosmetics_store/utils/assets.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:cosmetics_store/widgets/app_text.dart';
import 'package:cosmetics_store/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colours.cardBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                        text: product.name,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      )
                      .animate(delay: 300.ms)
                      .moveY(
                        begin: 50,
                        end: 0,
                        duration: 1000.ms,
                        curve: Curves.fastOutSlowIn,
                      )
                      .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn),
                  AppText(
                        text: "${product.reviews} reviews",
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colours.primaryTextColorLight,
                      )
                      .animate(delay: 700.ms)
                      .moveY(
                        begin: 30,
                        end: 0,
                        duration: 800.ms,
                        curve: Curves.fastOutSlowIn,
                      )
                      .fade(duration: 800.ms, curve: Curves.fastOutSlowIn),
                ],
              ),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                        text: "Max Size • ${product.sizeInML} ml",
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colours.primaryTextColorLight,
                      )
                      .animate(delay: 300.ms)
                      .moveY(
                        begin: 50,
                        end: 0,
                        duration: 1000.ms,
                        curve: Curves.fastOutSlowIn,
                      )
                      .fade(duration: 1000.ms, curve: Curves.fastOutSlowIn),
                  Row(
                        children: List.generate(
                          product.stars,
                          (index) => Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: CustomPaint(
                              painter: StarPainter(),
                              size: Size(15, 15),
                            ),
                          ),
                        ),
                      )
                      .animate(delay: 700.ms)
                      .moveY(
                        begin: 30,
                        end: 0,
                        duration: 800.ms,
                        curve: Curves.fastOutSlowIn,
                      )
                      .fade(duration: 800.ms, curve: Curves.fastOutSlowIn),
                ],
              ),
              SizedBox(height: 30),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "\$ ${product.price.toStringAsFixed(2)}",
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                      BouncingButton(
                        onPressed: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 28,
                          ),
                          decoration: BoxDecoration(
                            color: Colours.whiteColor,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: SvgPicture.asset(
                            Assets.shoppingBagIcon,
                            colorFilter: ColorFilter.mode(
                              Colours.blackColor,
                              BlendMode.srcIn,
                            ),
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ],
                  )
                  .animate(delay: 900.ms)
                  .moveY(
                    begin: 30,
                    end: 0,
                    duration: 700.ms,
                    curve: Curves.fastOutSlowIn,
                  )
                  .fade(duration: 700.ms, curve: Curves.fastOutSlowIn),
            ],
          ),
        )
        .animate(delay: 300.ms)
        .moveY(
          begin: 130,
          end: 0,
          duration: 1300.ms,
          curve: Curves.fastOutSlowIn,
        )
        .fade(duration: 1300.ms, curve: Curves.fastOutSlowIn);
  }
}
