import 'dart:convert';

import 'package:finsight/presentation/dashboard/dashboard_view.dart';
import 'package:finsight/service/api_service.dart';
import 'package:flutter/material.dart';

abstract class LoginDetail {
  void validateLogin({required String email, required String password, required BuildContext context});
}


class LoginViewModel extends ChangeNotifier implements LoginDetail{

@override
  void validateLogin({required String email, required String password, required BuildContext context})async {

    Map data = {
      "email": email,
      "password": password,
    };
    
    var verifiyUser = await CommonApiServices().saveData("/login", json.encode(data), context);
    var decodeData = json.decode(verifiyUser);

    if(decodeData != null){
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
    }

  }
}