import 'package:finsight/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color color;
  final double fontsize;
  final String? fontweight;
  const CustomText({
    this.color = AppColor.black,
    this.fontsize = 24,
    this.fontweight,
    this.text,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic
      ),
    );
  }
}