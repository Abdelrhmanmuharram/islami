import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/sura_item.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Suras List', style: textTheme.titleMedium),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  SuraDetailsScreen.routeName,
                  arguments: QuranService.getSuraFromIndex(index),
                );
              },
              child: SuraItem(sura: QuranService.getSuraFromIndex(index)),
            ),
            separatorBuilder: (_, _) => Divider(
              indent: screenWidth * 0.1,
              endIndent: screenWidth * 0.1,
            ),
            itemCount: 114,
          ),
        ),
      ],
    );
  }
}
