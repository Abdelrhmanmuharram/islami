import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/sura_item.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: textTheme.titleMedium,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran.svg',
                width: 28,
                height: 28,
                colorFilter: .mode(AppTheme.primary, .srcIn),
                fit: .scaleDown,
              ),
            ),
            onChanged: (value) {
              QuranService.suraSearch(value);
              setState(() {});
            },
          ),
        ),
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
                  arguments: QuranService.suraSearchResult[index],
                );
              },
              child: SuraItem(sura: QuranService.suraSearchResult[index]),
            ),
            separatorBuilder: (_, _) => Divider(
              indent: screenWidth * 0.1,
              endIndent: screenWidth * 0.1,
            ),
            itemCount: QuranService.suraSearchResult.length,
          ),
        ),
      ],
    );
  }
}
