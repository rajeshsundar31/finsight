import 'package:finsight/component/custom_button.dart';
import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/constants/app_strings.dart';
import 'package:finsight/core/utils/app_size.dart';
import 'package:finsight/core/utils/asset_utils.dart';
import 'package:finsight/presentation/register/register_view.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 90),
            child: Text(AppStrings.welcome, style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24
            ),),
          ),
          Image.asset(AssetsUtils.landingAvatar),
          CustomButton(
            color: AppColor.purple,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterUser()));
            },
            width: displayWidth(context)/1.2,
            text: AppStrings.continueBtn,
          )
        ],
      ),
    );
  }
}