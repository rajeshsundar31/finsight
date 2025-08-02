import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/constants/app_strings.dart';
import 'package:finsight/presentation/dashboard/dashboard_view.dart';
import 'package:finsight/presentation/dashboard/dashboard_view_model.dart';
import 'package:finsight/presentation/profile/profile.dart';
import 'package:finsight/presentation/scan_pay/scan_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {


   final List<Widget> _pages = <Widget>[const Dashboard(), const ScanCode(), const ProfileScreen()];
  
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