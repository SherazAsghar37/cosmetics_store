import 'package:cosmetics_store/screens/home-screen/widgets/home_app_bar.dart';
import 'package:cosmetics_store/screens/home-screen/widgets/products_grid.dart';
import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _backgroundColor = Colours.transparentColor;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        _backgroundColor = Colours.backgroundColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
      color: _backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set to transparent so it blends
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  HomeAppBar(size: size),
                  SizedBox(height: 40),
                  ProductsGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
