import 'package:finsight/core/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(context),
      )
      );
  }

  Widget _buildBody (BuildContext context) {
    return Column(
      children: [
        _buildImage(context),
        _buildcard(context)
      ],
    );
  }

  Widget _buildImage(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Center(
        child: CircleAvatar(
          maxRadius: 40,
          minRadius: 30,
          foregroundImage: AssetImage(AssetsUtils.myProfile),
        ),
      ),
    );
  }

  Widget _buildcard(BuildContext context){
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              const Text("Language"),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_right))
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text("Dark Mode"),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.dark_mode))
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text("Terms and Conditions"),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.checklist_rtl_outlined))
            ],
          ),
          const Divider(),
          Row(
            children: [
              const Text("Log Out"),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.logout))
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

 
}