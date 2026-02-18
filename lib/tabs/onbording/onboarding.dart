import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/core/local_storage.dart';
import 'package:islami/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbording extends StatefulWidget {
  static const String routeName = '/Onbording';

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/home_header.png',
            height: MediaQuery.sizeOf(context).height * 0.25,
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/Onbording_1.png',
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Welcome To Islmi App',
                      style: textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/Onbording_2.png',
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Welcome To Islami',
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    Text(
                      'We Are Very Excited To Have You In Our Community',
                      style: textTheme.titleMedium!.copyWith(
                        color: AppTheme.primary,
                      ),
                      textAlign: .center,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/Onbording_3.png',
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Reading the Quran',
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    Text(
                      'Read, and your Lord is the Most Generous',
                      style: textTheme.titleMedium!.copyWith(
                        color: AppTheme.primary,
                      ),
                      textAlign: .center,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/Onbording_4.png',
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Bearish',
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    Text(
                      'Praise the name of your Lord, the Most High',
                      style: textTheme.titleMedium!.copyWith(
                        color: AppTheme.primary,
                      ),
                      textAlign: .center,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/Onbording_5.png',
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Holy Quran Radio',
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    Text(
                      'You can listen to the Holy Quran Radio through the application for free and easily',
                      style: textTheme.titleMedium!.copyWith(
                        color: AppTheme.primary,
                      ),
                      textAlign: .center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: currentPage == 0
                        ? SizedBox(width: 20)
                        : Text(
                            'Back',
                            style: textTheme.titleSmall!.copyWith(
                              color: AppTheme.primary,
                            ),
                          ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      spacing: 8.0,
                      radius: 16,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      dotColor: Color(0xff707070),
                      activeDotColor: AppTheme.primary,
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: currentPage == 4
                        ? InkWell(
                            onTap: () async {
                              await LocalStorage.setOnBoardingSeen();

                              Navigator.of(
                                context,
                              ).pushReplacementNamed(HomeScreen.routeName);
                            },
                            child: Text(
                              'Finish',
                              style: textTheme.titleSmall!.copyWith(
                                color: AppTheme.primary,
                              ),
                            ),
                          )
                        : Text(
                            'Next',
                            style: textTheme.titleSmall!.copyWith(
                              color: AppTheme.primary,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
