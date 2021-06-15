import 'package:flutter/material.dart';

import 'historicNewsPage.dart';
import 'lastHourPage.dart';

class HomePageAnsa extends StatefulWidget {
  @override
  _HomePageAnsaState createState() => _HomePageAnsaState();
}

class _HomePageAnsaState extends State<HomePageAnsa> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {},
        ),
        title: Image.asset(
          "assets/logo_ansa.jpg",
          width: 300,
          height: 100,
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          LastHourPage(),
          HistoricNewsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.black,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.linear);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "In tendenza",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_full),
            label: "Tutti",
          )
        ],
      ),
    );
  }
}
