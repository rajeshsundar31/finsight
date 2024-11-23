import 'package:finsight/component/custom_button.dart';
import 'package:finsight/component/custom_text.dart';
import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/utils/app_size.dart';
import 'package:finsight/presentation/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController detail = TextEditingController();
  TextEditingController amount = TextEditingController();
  List<String> expenseType = ['Income', 'Expenses'];
  String? selectedValue = "Transaction Type";
  late String transactionType;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Consumer<DashboardViewModel>(
        builder: (context, controller, child) {
          return Dialog(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
              width: displayWidth(context) / 0.5,
              height: displayHeight(context) / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CustomText(
                    text: "Add Expense Details",
                    color: AppColor.black,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: detail,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'expense cannot be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Expense Detail",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: amount,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'amount cannot be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Amount", border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                          decoration:
                              const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Expense Type"
                                ),
                          items: expenseType.map((String val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                val,
                              ),
                            );
                          }).toList(),
                      validator: (value) => value == null? 'Dropdown cannot empty' : null,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                              transactionType = value;
                            });
                          })),
                  CustomButton(
                    width: displayWidth(context) / 2,
                    color: AppColor.purple,
                    text: "Add Expenses",
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        controller.saveDataToDb(amount: double.parse(amount.text), expenseDetail: detail.text, expenseType: transactionType, context: context);
                        Navigator.pop(context);
                      }
                      
                    },
                  )
                ],
              )),
        );
        },
        
      ),
    );
  }
}
