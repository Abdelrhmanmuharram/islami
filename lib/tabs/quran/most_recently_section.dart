import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/most_recently_item.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';

class MostRecentlySection extends StatefulWidget {
  @override
  State<MostRecentlySection> createState() => _MostRecentlySectionState();
}

class _MostRecentlySectionState extends State<MostRecentlySection> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: QuranService.mostRecentlySura.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Most Recently',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.16,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (_, index) => MostRecentlyItem(
                  QuranService.mostRecentlySura.reversed.toList()[index],
                ),
                separatorBuilder: (_, _) => SizedBox(width: 10),
                itemCount: QuranService.mostRecentlySura.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
