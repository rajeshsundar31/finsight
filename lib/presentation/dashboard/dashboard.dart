import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/constants/app_strings.dart';
import 'package:finsight/presentation/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomBar(context),
      )
      );
  }

  Widget _buildBody (BuildContext context) {
    return Column(
      children: [
      ],
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
        selectedItemColor: AppColor.btn_green,
        onTap: dashboard.onTapIndex,
        );
    }
    );
  }
}