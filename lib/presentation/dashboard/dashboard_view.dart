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
      WidgetsBinding.instance.addPostFrameCallback((_) {
      final dashboardModel = Provider.of<DashboardViewModel>(context, listen: false);
      dashboardModel.init();
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
          backgroundColor: AppColor.cardcolor,
          shape: const CircleBorder(),
          onPressed: (){
            showDialog(context: context, builder: (context) {
              return const CustomDialog();
            });
          }, 
          child: const Icon(Icons.add, color: AppColor.white,),),
        body: Column(
          children: [
            _buildGreetings(context),
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
    return Card(
      color: AppColor.cardcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Master Card",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900
                ),
                ),
            ),
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              const Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "Total Balance",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w200
                  ),
                  ),
              ),
              SizedBox(
                width: 50,
                 child: Padding(
                   padding: const EdgeInsets.only(right: 16.0),
                   child: Image.asset(AssetsUtils.chip),
                 ),
               ),
             ],
           ),
           const Row(
             children: [
              Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  "\$ 1,20,0000",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w200
                  ),
                  ),
              ),
               
             ],
           ),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                Padding(
                  padding: EdgeInsets.only(right: 130.0),
                  child: Column(
                      children: [
                        Text(
                        "Account Number",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w200
                        ),
                        ),
                        Text(
                        "   ********3001",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300
                        ),
                        ),
                      ],
                    ),
                ),
                  Column(
                    children: [
                      Text(
                      "Valid Date",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200
                      ),
                      ),
                      Text(
                      "09/25",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w300
                      ),
                      ),
                    ],
                  ),
               ],
             )
            
             
        ],
      ),
    );
  }

  Widget _buildGreetings (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            _buildImage(context),
            const SizedBox(width: 8.0,),
            Column(
              children: [
                Text(
                  DateTime.now().hour >= 4 && DateTime.now().hour < 12? "Good Morning" 
                  : DateTime.now().hour >= 12 && DateTime.now().hour < 16? "Good Afternoon" 
                  : DateTime.now().hour >= 16 && DateTime.now().hour < 19? "Good Evening" 
                  : DateTime.now().hour >= 19 || DateTime.now().hour < 4? "Good Night": "",
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  Text( '${DateFormat('E').format(DateTime.now())}, '
                    '${
                      DateFormat('d').format(DateTime.now())}th ${DateFormat('MMM').format(DateTime.now())}',
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400
                  ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context){
    return Center(
      child: CircleAvatar(
        maxRadius: 28,
        minRadius: 16,
        foregroundImage: AssetImage(AssetsUtils.myProfile),
      ),
    );
  }
}