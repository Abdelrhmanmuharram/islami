import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/widget/loading_indicator.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = '/Hadeth';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  late Hadeth hadeth;

  @override
  Widget build(BuildContext context) {
    hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Hadeth ${hadeth.num}')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Image.asset(
                  'assets/images/left_corner.png',
                  height: screenHeight * 0.1,
                ),
                Text(hadeth.title, style: textTheme.headlineSmall),
                Image.asset(
                  'assets/images/right_corner.png',
                  height: screenHeight * 0.1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                itemBuilder: (_, index) => Text(
                  hadeth.contant[index],
                  textAlign: .center,
                  style: textTheme.titleLarge!.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                separatorBuilder: (_, _) => SizedBox(height: 10),
                itemCount: hadeth.contant.length,
              ),
            ),
          ),
          Image.asset('assets/images/bottom_decoration.png'),
        ],
      ),
    );
  }
}
