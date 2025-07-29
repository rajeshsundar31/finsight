import 'dart:convert';
import 'package:finsight/model/transaction_model.dart';
// import 'package:finsight/presentation/amount/amount.dart';
import 'package:finsight/service/api_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class DashboardViewModel extends ChangeNotifier {
  List<Transactions> detailsList = [];
  String? barcodeRes;
  String? scanres;
  late String? titleName = '', upiId = '';
  int selectedIndex = 0;

  init(){
    fetchExpenseList();
  }
  
  void fetchExpenseList () async {
    var expense = await CommonApiServices().fetchData("/getexpense");
    var decodeData = json.decode(expense);
    if(decodeData != null) {
      
     detailsList = List<Transactions>.from(
      decodeData.map((x) => Transactions.fromJson(x))
    );
    notifyListeners();
    } else {
      throw jsonDecode(expense)['message'] ?? "Unknown error occoured";
    }
  }

  void saveDataToDb({required double  amount, required String expenseDetail, required String expenseType, required BuildContext context}) async {
    DateTime currentDate = DateTime.now();
     
    // String formattedDate = "${currentDate.year.toString().padLeft(4, '0')}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}";

    Map data = {
      "expenseDetail": expenseDetail,
      "amount": amount,
      "expenseType": expenseType,
      "tansactionDate": currentDate.toIso8601String()
    };
    await CommonApiServices().saveData("/expensedetail", json.encode(data), context);
    fetchExpenseList();
    notifyListeners();

  }

  void onTapIndex(int index){
    if (index == 0){
      selectedIndex = index;
    } else if (index == 1) {
      selectedIndex = index;
      // scanQR();
    } else {
      selectedIndex = index;

    }
    notifyListeners();
  }

  // Future scanQR() async {
  //   try {
  //     barcodeRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'cancel', true, ScanMode.QR);
  //   } on PlatformException {
  //     barcodeRes = "Failed to Scan QR Code";
  //   }

  //     Uri upiUri = Uri.parse(barcodeRes!);
  //     upiId = upiUri.queryParameters['pa'] ?? "Parameter not found";
  //     titleName = upiUri.queryParameters['pn'] ?? "Parameter not found";
  //     scanres = barcodeRes;

  //     // Navigator.push(context, MaterialPageRoute(builder:(context) => AmountPay(title: TitleName.toString(), upiId: Upiid.toString()),));

  //     notifyListeners();
  // }


 
}