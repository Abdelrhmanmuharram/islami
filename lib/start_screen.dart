import 'package:flutter/material.dart';
import 'package:islami/core/local_storage.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/onbording/onbording.dart';
import 'package:islami/widget/loading_indicator.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = '/start';
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    checkOnboarding();
  }

  Future<void> checkOnboarding() async {
    bool seen = await LocalStorage.isOnboardingSeen();

    if (seen) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, Onbording.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: LoadingIndicator()));
  }
}
