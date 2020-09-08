import 'package:flutter/material.dart';

const String eiffelTower = "assets/images/eiffel_tower.jpg";
const String colosseum = "assets/images/colosseum.jpg";
const String statueOfLiberty = "assets/images/statue_of_liberty.jpg";
const String sacreCoeur = "assets/images/sacre_coeur.jpg";
const String tajMahal = "assets/images/taj_mahal.jpg";

class PageViewIndicator extends StatefulWidget {
  PageViewIndicator({Key key}) : super(key: key);

  @override
  _PageViewIndicatorState createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  final List<String> images = [
    eiffelTower,
    colosseum,
    statueOfLiberty,
    sacreCoeur,
    tajMahal,
  ];

  int _currentPage = 0;

  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Page view indicator'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 8,
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
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
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
            // Spacer(),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  _currentPage != 0 ? _buildPrevButton() : SizedBox(height: 0),
                  Spacer(),
                  _currentPage != images.length - 1
                      ? _buildNextButton()
                      : SizedBox(height: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlatButton _buildNextButton() {
    return FlatButton(
      onPressed: () {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Next'.toUpperCase(),
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          SizedBox(width: 10.0),
          Icon(
            Icons.arrow_forward,
            color: Colors.black,
            size: 22.0,
          ),
        ],
      ),
    );
  }

  FlatButton _buildPrevButton() {
    return FlatButton(
      onPressed: () {
        _pageController.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 22.0,
          ),
          SizedBox(width: 10.0),
          Text(
            'Prev'.toUpperCase(),
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
