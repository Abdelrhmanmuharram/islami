import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected.dart';
import 'package:islami/nav_bar_unselected.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnSelected(imageName: 'quran'),
            activeIcon: NavBarSelected(imageName: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnSelected(imageName: 'sorah'),
            activeIcon: NavBarSelected(imageName: 'sorah'),
            label: 'Sorah',
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
