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

  List<String> tabsBackgraound = [
    'quran_background',
    'hadeth_background',
    'sebha_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: .fill,
            image: AssetImage(
              'assets/images/${tabsBackgraound[currentindex]}.png',
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/home_header.png',
                height: MediaQuery.sizeOf(context).height * 0.15,
                fit: .fitWidth,
              ),
            ),
            Expanded(child: tabs[currentindex]),
          ],
        ),
      ),
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
