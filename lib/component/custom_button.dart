import 'package:finsight/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  const CustomButton({
    this.color = AppColor.purple,
    this.text = "button",
    this.onPressed,
    this.height,
    this.width,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed, 
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
          )
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.white
        ),
      )),
    );
  }
}