import 'package:cosmetics_store/model/product_model.dart';
import 'package:cosmetics_store/utils/curved_rect_tween.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.imagePath,
      createRectTween:
          (begin, end) => CurveRectTween(
            begin: begin,
            end: end,
            curve: Curves.fastOutSlowIn,
          ),
      child: Image.asset(product.imagePath),
    );
  }
}
