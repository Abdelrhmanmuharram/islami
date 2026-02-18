import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/widget/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/widget/loading_indicator.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      loadHadeth();
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenSzie = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hadeth_background_tap.png'),
          ),
          borderRadius: BorderRadius.circular(20),
          color: AppTheme.primary,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadeth_left_corner.png',
                    height: screenSzie * 0.1,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        hadeth!.title,
                        style: textTheme.titleLarge!.copyWith(
                          color: AppTheme.black,
                        ),
                        textAlign: .center,
                      ),
                    ),
                  Image.asset(
                    'assets/images/hadeth_right_corner.png',
                    height: screenSzie * 0.1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: hadeth == null
                  ? LoadingIndicator()
                  : InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          HadethDetailsScreen.routeName,
                          arguments: hadeth,
                        );
                      },
                      child: ListView.separated(
                        shrinkWrap: false,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (_, index) => Text(
                          hadeth!.contant[index],
                          textAlign: .center,
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.black,
                          ),
                        ),
                        separatorBuilder: (_, _) => SizedBox(height: 10),
                        itemCount: hadeth!.contant.length,
                      ),
                    ),
            ),
            Image.asset(
              'assets/images/hadeth_footer.png',
              width: double.infinity,
              fit: .fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethFileContant = await rootBundle.loadString(
      'assets/Hadeth/h${widget.index + 1}.txt',
    );
    List<String> hadethLines = hadethFileContant.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> contant = hadethLines;
    hadeth = Hadeth(title: title, contant: contant, num: widget.index + 1);
    setState(() {});
  }
}
