import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected.dart';
import 'package:islami/nav_bar_unselected.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (index) {
          currentindex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnSelected(imageName: 'quran'),
            activeIcon: NavBarSelected(imageName: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnSelected(imageName: 'hadeth'),
            activeIcon: NavBarSelected(imageName: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnSelected(imageName: 'sebha'),
            activeIcon: NavBarSelected(imageName: 'sebha'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnSelected(imageName: 'radio'),
            activeIcon: NavBarSelected(imageName: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnSelected(imageName: 'time'),
            activeIcon: NavBarSelected(imageName: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
