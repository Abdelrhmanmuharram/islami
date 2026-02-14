import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/widget/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/Sura';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late Sura sura;

  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.of(context).size.height;
    loadSura();
    return Scaffold(
      appBar: AppBar(title: Text(sura.englishSurahsName)),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Image.asset(
                'assets/images/left_corner.png',
                height: screenHeight * 0.1,
              ),
              Text(sura.arabicSurasName, style: textTheme.headlineSmall),
              Image.asset(
                'assets/images/right_corner.png',
                height: screenHeight * 0.1,
              ),
            ],
          ),
          Expanded(
            child: ayat.isEmpty
                ? LoadingIndicator()
                : ListView.separated(
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      textAlign: .center,
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    separatorBuilder: (_, _) => SizedBox(height: 10),
                    itemCount: ayat.length,
                  ),
          ),
          Image.asset('assets/images/bottom_decoration.png'),
        ],
      ),
    );
  }

  Future<void> loadSura() async {
    String suraFileContant = await QuranService.loadSuraFile(sura.num);
    ayat = suraFileContant.split('\r\n');
    setState(() {});
  }
}
