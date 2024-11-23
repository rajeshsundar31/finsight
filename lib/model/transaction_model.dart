// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));

String transactionsToJson(Transactions data) => json.encode(data.toJson());

class Transactions {
    String expenseDetail;
    int amount;
    String expenseType;
    DateTime tansactionDate;

    Transactions({
        required this.expenseDetail,
        required this.amount,
        required this.expenseType,
        required this.tansactionDate,
    });

    factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        expenseDetail: json["expenseDetail"],
        amount: json["amount"],
        expenseType: json["expenseType"],
        tansactionDate: DateTime.parse(json["tansactionDate"]),
    );

    Map<String, dynamic> toJson() => {
        "expenseDetail": expenseDetail,
        "amount": amount,
        "expenseType": expenseType,
        "tansactionDate": "${tansactionDate.year.toString().padLeft(4, '0')}-${tansactionDate.month.toString().padLeft(2, '0')}-${tansactionDate.day.toString().padLeft(2, '0')}",
    };
}
