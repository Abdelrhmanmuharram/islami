import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarSelected extends StatelessWidget {
  String imageName;

  NavBarSelected({required this.imageName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 22),
      decoration: BoxDecoration(
        color: Color(0xFF202020).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        'assets/icons/$imageName.svg',
        height: 28,
        width: 28,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
