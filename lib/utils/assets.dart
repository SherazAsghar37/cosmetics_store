import 'package:cosmetics_store/model/product_model.dart';

abstract class Assets {
  //images
  static const String product1 =
      'assets/images/668adc4fcd57736f5c718ef0_product-06.png';
  static const String product2 =
      'assets/images/coco-noir-chanel-pink-aesthetic-plrz6za4j9w81o44.png';
  static const String product3 =
      'assets/images/lg_PFcFK51Hy0J0x8dk2hJTpjSQoTA6wsxcdfAwtFMS.png';
  static const String product4 = 'assets/images/Glowify-gallery-img-1.png';
  static const String product5 =
      'assets/images/f6a5603cd8028babc9c5a74cc3327c99.png';
  static const String product6 =
      'assets/images/668adc4fcd57736f5c718ef6_product-12.png';
  static const String product7 =
      'assets/images/668adc4fcd57736f5c718ef9_product-18.png';
  static const String profilePicture =
      'assets/images/8ebb1801-6af2-4a3b-b0c4-ae4a7de2b09d_removalai_preview.png';

  //icons
  static const String arrowForwardIcon =
      'assets/icons/arrows-direction-down-2-svgrepo-com.svg';
  static const String searchIcon =
      'assets/icons/search-normal-1-svgrepo-com.svg';
  static const String shoppingBagIcon =
      'assets/icons/shopping-bag-3-svgrepo-com.svg';

  static final List<ProductModel> data = [
    ProductModel(
      imagePath: Assets.product1,
      name: "Liquid Collagen",
      subTitle: "Skin regenration",
      price: 7.50,
      reviews: 10,
      sizeInML: 100,
      stars: 4,
    ),
    ProductModel(
      imagePath: Assets.product2,
      name: "Chanel: Noir",
      subTitle: "Nobel perfume",
      price: 99.99,
      reviews: 19,
      sizeInML: 250,
      stars: 5,
    ),
    ProductModel(
      imagePath: Assets.product3,
      name: "NYX: Concealer",
      subTitle: "Eyelid care",
      price: 24.99,
      reviews: 284,
      sizeInML: 100,
      stars: 5,
    ),
    ProductModel(
      imagePath: Assets.product4,
      name: "Recovery Complex",
      subTitle: "Night Care",
      price: 56.50,
      reviews: 223,
      sizeInML: 120,
      stars: 3,
    ),
    ProductModel(
      imagePath: Assets.product5,
      name: "Pure Wonder",
      subTitle: "Active Serum",
      price: 25.50,
      reviews: 56,
      sizeInML: 50,
      stars: 2,
    ),
    ProductModel(
      imagePath: Assets.product6,
      name: "Armani: Retainer",
      subTitle: "Skin care",
      price: 39.99,
      reviews: 140,
      sizeInML: 80,
      stars: 3,
    ),
    ProductModel(
      imagePath: Assets.product7,
      name: "Cosmetic",
      subTitle: "Repairing Spray",
      price: 50.0,
      reviews: 152,
      sizeInML: 100,
      stars: 3,
    ),
  ];
}
