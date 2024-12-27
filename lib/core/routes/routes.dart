import 'package:finsight/presentation/dashboard/dashboard.dart';
import 'package:finsight/presentation/landing_page.dart';
import 'package:finsight/presentation/login/login_view.dart';
import 'package:finsight/presentation/register/register_view.dart';
import 'package:flutter/material.dart';

class CommonRoutes {
  Route<dynamic> generateRoutes(RouteSettings setting) {
    switch (setting.name){
      case '/':
        return MaterialPageRoute(builder: (context) => const LandingPage());
      case '/register':
        return MaterialPageRoute(builder: (context) => const RegisterUser());
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginView());
      case '/dashboard':
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${setting.name}'),
          ),
        ));
    }
  }
}