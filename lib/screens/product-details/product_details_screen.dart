import 'package:cosmetics_store/model/product_model.dart';
import 'package:cosmetics_store/screens/product-details/widgets/arrow_back_button.dart';
import 'package:cosmetics_store/screens/product-details/widgets/details_background.dart';
import 'package:cosmetics_store/screens/product-details/widgets/details_card.dart';
import 'package:cosmetics_store/screens/product-details/widgets/product_image.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product-details-screen';
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            DetailsBackground(size: size),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowBackButton(),
                  SizedBox(height: 20),
                  ProductImage(product: product),
                  DetailsCard(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
