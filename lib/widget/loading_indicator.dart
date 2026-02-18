import 'package:flutter/material.dart';
import 'package:islami/widget/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  Color? color;

  LoadingIndicator({this.color});
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppTheme.primary));
  }
}
