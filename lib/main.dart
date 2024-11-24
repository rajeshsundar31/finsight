import 'package:finsight/presentation/dashboard/dashboard_view_model.dart';
import 'package:finsight/presentation/landing_page.dart';
import 'package:finsight/presentation/login/login_view_model.dart';
import 'package:finsight/presentation/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (context) => RegisterViewModel(),),
        ChangeNotifierProvider(create:  (context) => DashboardViewModel(),),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LandingPage(),
      ),
    );
  }
}

