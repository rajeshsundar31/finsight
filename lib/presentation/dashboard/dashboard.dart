import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/constants/app_strings.dart';
import 'package:finsight/presentation/contact/contact.dart';
import 'package:finsight/presentation/dashboard/dashboard_view.dart';
import 'package:finsight/presentation/dashboard/dashboard_view_model.dart';
import 'package:finsight/presentation/landing_page.dart';
import 'package:finsight/presentation/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  String? barcodeRes;
  String? scanres;
  late String? TitleName = '', Upiid = '';

   Future scanQR() async {
    try {
      barcodeRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeRes = "Failed to Scan QR Code";
    }

      print("scanres${barcodeRes}");
      Uri upiUri = Uri.parse(barcodeRes!);
      Upiid = upiUri.queryParameters['pa'] ?? "Parameter not found";
      TitleName = upiUri.queryParameters['pn'] ?? "Parameter not found";
      scanres = barcodeRes;

      // notifyListeners();
  }

   List<Widget> _pages = <Widget>[const Dashboard(), const LandingPage(), ContactList()];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColor.white,
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomBar(context),
      )
      );
  }

  Widget _buildBody (BuildContext context) {
    return Consumer<DashboardViewModel> (builder: (context, dashboard, child)
     {
      return _pages.elementAt(dashboard.selectedIndex);
     }
    );
  }


  Widget _buildBottomBar(BuildContext context) {
    return Consumer<DashboardViewModel>(builder: (context, dashboard, child)
     {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: AppStrings.scan
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.profile
            )
        ],
        currentIndex: dashboard.selectedIndex,
        selectedItemColor: AppColor.primary,
        onTap: dashboard.onTapIndex,
        );
    }
    );
  }
}