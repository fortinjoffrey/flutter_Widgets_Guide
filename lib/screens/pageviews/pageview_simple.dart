import 'package:flutter/material.dart';

const String eiffelTower = "assets/images/eiffel_tower.jpg";
const String colosseum = "assets/images/colosseum.jpg";
const String statueOfLiberty = "assets/images/statue_of_liberty.jpg";
const String sacreCoeur = "assets/images/sacre_coeur.jpg";
const String tajMahal = "assets/images/taj_mahal.jpg";

class PageViewSimple extends StatefulWidget {
  PageViewSimple({Key key}) : super(key: key);

  @override
  _PageViewSimpleState createState() => _PageViewSimpleState();
}

class _PageViewSimpleState extends State<PageViewSimple> {
  final List<String> images = [
    eiffelTower,
    colosseum,
    statueOfLiberty,
    sacreCoeur,
    tajMahal,
  ];

  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page view simple'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
