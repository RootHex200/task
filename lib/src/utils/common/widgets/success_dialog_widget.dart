import 'package:flutter/material.dart';
import 'package:task/src/utils/colors/app_colors.dart';

successDialog(BuildContext context,String title) {
  return showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          title: Center(child: Text(title)),
          content: const SizedBox(
            height: 100,
            child: Center(
              child: Icon(
                Icons.check_circle_outline,
                color: AppColors.greenColor,
                size: 50,
              ),
            ),
          ),
        );
      });
}
