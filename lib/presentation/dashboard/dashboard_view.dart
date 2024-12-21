import 'package:finsight/component/carosel.dart';
import 'package:finsight/component/custom_dialog.dart';
import 'package:finsight/component/custom_text.dart';
import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/utils/app_size.dart';
import 'package:finsight/core/utils/asset_utils.dart';
import 'package:finsight/presentation/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final today = DateTime.now();

  @override
  void initState() {
    Future.microtask((){
      Provider.of<DashboardViewModel>(context, listen: false).init();
    });
    super.initState();
  }

   dateformat(String datevalue){
    DateTime dateTime = DateTime.parse(datevalue);
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.purple,
          shape: const CircleBorder(),
          onPressed: (){
            showDialog(context: context, builder: (context) {
              return const CustomDialog();
            });
          }, 
          child: const Icon(Icons.add, color: AppColor.white,),),
        body: Column(
          children: [
             SizedBox(
              width: displayWidth(context)/1,
              height: displayHeight(context)/4,
               child: _buildCard(context),
             ),
             Expanded(
               child: Consumer<DashboardViewModel>(
                builder: (context, control, child) {
                 return control.detailsList.isEmpty? Container(): ListView.builder(
                  itemCount: control.detailsList.length,
                  itemBuilder: (BuildContext context, int index) {
                     String formattedDate = DateFormat('dd-MM-yyyy').format(control.detailsList[index].tansactionDate);              
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: control.detailsList[index].expenseType == "Income"? const Icon(Icons.circle, color: AppColor.green,): const Icon(Icons.circle, color: AppColor.red,),
                        title: Text(control.detailsList[index].expenseDetail, style: const TextStyle(color: AppColor.black),
                        ),
                        trailing: IconButton(onPressed: (){
                         showModalBottomSheet(context: context, 
                        //  backgroundColor: AppColor.gold,
                         builder: (context) {
                           return SizedBox(
                            height: displayHeight(context)/3,
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Center(
                                  child: CustomText( text: "Payment Details", fontsize: 24,),
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.message),
                                    const CustomText(text: "Detail :", fontsize: 16,),
                                    CustomText(text: control.detailsList[index].expenseDetail, fontsize: 12,),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.date_range),
                                    const CustomText(text: "Date :", fontsize: 16,),
                                    CustomText(text: formattedDate ,fontsize: 12,),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.money),
                                    const CustomText(text: "Amount :", fontsize: 16,),
                                    CustomText(text: control.detailsList[index].amount.toString(), fontsize: 12,),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.currency_exchange),
                                    const CustomText(text: "Type :", fontsize: 16,),
                                    CustomText(text: control.detailsList[index].expenseType, fontsize: 12,),
                                  ],
                                ),
                              ],
                             ),
                           );
                         },);
                        }, icon: const Icon(Icons.arrow_forward_ios)),
                        ),
                    );
                 });
               }),
             ),
          ],
        ),
      ));
  }

  Widget _buildCard(BuildContext context) {
    return const Card(
      color: AppColor.cardcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Align(
            alignment: Alignment.topLeft,
             child: Text(
               "\$30,000",
               style: TextStyle(
                 color: AppColor.white,
                 fontSize: 24,
                 fontWeight: FontWeight.w900
               ),
               ),
           ),
           Align(
            alignment: Alignment.topLeft,
             child: Text(
               "****-***-****-***-3001",
               style: TextStyle(
                 color: AppColor.white,
                 fontSize: 24,
                 fontWeight: FontWeight.w600
               ),
               ),
           ),
        ],
      ),
    );
  }
}