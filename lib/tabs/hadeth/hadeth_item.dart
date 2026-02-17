import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class HadethItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Text(
                    'data',
                    style: textTheme.titleLarge!.copyWith(
                      color: AppTheme.black,
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
              child: ListView.separated(
                itemBuilder: (_, _) => Text(
                  'data',
                  textAlign: .center,
                  style: textTheme.titleMedium!.copyWith(color: AppTheme.black),
                ),
                separatorBuilder: (_, _) => SizedBox(height: 10),
                itemCount: 50,
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
}
