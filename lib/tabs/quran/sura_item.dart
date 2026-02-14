import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;
  SuraItem({required this.sura});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          height: 52,
          width: 52,
          alignment: .center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sur_number_frame.png'),
            ),
          ),
          child: Text('${sura.num}', style: textTheme.titleSmall),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(sura.englishSurahsName, style: textTheme.titleLarge),
            Text('${sura.ayaCount} Verses', style: textTheme.titleSmall),
          ],
        ),
        Spacer(),
        Text(sura.arabicSurasName, style: textTheme.titleLarge),
      ],
    );
  }
}
