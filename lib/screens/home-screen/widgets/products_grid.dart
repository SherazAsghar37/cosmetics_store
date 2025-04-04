import 'package:cosmetics_store/screens/home-screen/widgets/offer_card.dart';
import 'package:cosmetics_store/screens/home-screen/widgets/product_card.dart';
import 'package:cosmetics_store/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final data = Assets.data;
  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 20,
      children: List.generate(data.length + 1, (index) {
        int i = index == 0 ? 0 : index - 1;
        final e = data.elementAt(i);
        return StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: (index == 1 ? OfferCard() : ProductCard(product: e))
              .animate(delay: 100.ms + (i * 150).ms)
              .moveX(
                begin: 150,
                end: 0,
                curve: Curves.fastOutSlowIn,
                duration: 1700.ms,
              ),
        );
      }),
    );
  }
}
