import 'package:flutter/material.dart';
import 'package:task/src/utils/colors/app_colors.dart';

class ButtonClickWidgets extends StatelessWidget {
  final Function()? onpress;
  final IconData icon;
  const ButtonClickWidgets({super.key,required this.onpress,required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
          height: 30,
          width: 30,
          color: AppColors.primaryAppRedColor,
          child: Center(
              child: Icon(
            icon,
            size: 30,
            color: AppColors.primaryWhiteColor,
          ))),
    );
  }
}
