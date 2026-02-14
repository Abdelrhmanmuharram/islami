import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';

class MostRecentlyItem extends StatelessWidget {
  Sura sura;

  MostRecentlyItem(this.sura);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(SuraDetailsScreen.routeName, arguments: sura);
      },
      child: Container(
        height: double.infinity,
        width: screenSize.width * .7,
        padding: EdgeInsets.only(left: 12, right: 8),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(
                    sura.englishSurahsName,
                    style: textTheme.headlineSmall!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                  Text(
                    sura.arabicSurasName,
                    style: textTheme.headlineSmall!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                  Text(
                    '${sura.ayaCount} Verses',
                    style: textTheme.titleSmall!.copyWith(
                      color: AppTheme.black,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/most_recent.png',
              height: screenSize.height * 0.14,
              width: screenSize.width * 0.3,
              fit: .fill,
            ),
          ],
        ),
      ),
    );
  }
}
