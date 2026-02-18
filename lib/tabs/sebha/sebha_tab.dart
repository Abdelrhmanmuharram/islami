import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(height: 16),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: textTheme.headlineSmall!.copyWith(
            fontSize: 34,
            color: AppTheme.white,
          ),
        ),
        SizedBox(height: 16),
        Image.asset('assets/images/head_sebha.png'),
        GestureDetector(
          onTap: () {
            setState(() {
              count++;
              angle += (2 * pi) / 33;
              sebhaCount();
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: angle,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [Image.asset('assets/images/sebha.png')],
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    azkar[zekrIndex],
                    style: textTheme.headlineSmall!.copyWith(
                      fontSize: 34,
                      color: AppTheme.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$count',
                    style: textTheme.headlineSmall!.copyWith(
                      fontSize: 34,
                      color: AppTheme.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  int count = 0;
  double angle = 0.0;
  int zekrIndex = 0;
  List<String> azkar = ['سبحان الله', 'الحمدلله', 'لا اله الا الله'];

  void sebhaCount() {
    if (count == 33) {
      count = 0;
      angle = 0.0;
      zekrIndex++;
      if (zekrIndex == azkar.length) {
        zekrIndex = 0;
      }
    }
  }
}
