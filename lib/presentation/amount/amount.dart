import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountPay extends StatefulWidget {
  final String title, upiId;
  const AmountPay({super.key, required this.title, required this.upiId});

  @override
  State<AmountPay> createState() => _AmountPayState();
}

class _AmountPayState extends State<AmountPay> {
  TextEditingController messagecontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? titleText;
  String? upId;
  String? name, amount, remarks, agentid;

  @override
  void initState() {
    // titleText = '${widget.title}';
    // upId = '${widget.upiId}';
     titleText = 'rajeshsundr';
    upId = 'rajeshsundarjr-10';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Container(
                    height: displayHeight(context) / 2,
                    width: displayWidth(context),
                    // color: AppColor.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(90.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text('$titleText'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text('$upId'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: TextFormField(
                              controller: amountcontroller,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: "₹ 0",
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none
                              ),
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Please Enter valid Amount";
                                } else if (int.parse(value) < 0 || int.parse(value) == 0){
                                  return "Please enter valid amount";

                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: displayWidth(context) / 4,
                            height: 40,
                            child: TextFormField(
                              cursorColor: AppColor.primary,
                              decoration: const InputDecoration(
                                  hintText: "Add Note",
                                  hintStyle: TextStyle(color: AppColor.primary),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColor.primary),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.primary))),
                              controller: messagecontroller,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: displayWidth(context)/1.6,
                    
                child: ElevatedButton(
                  
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                    setState(() {
                      name = titleText;
                      amount = amountcontroller.text;
                      remarks = messagecontroller.text;
                      agentid = upId;
                      print("aga${agentid}");
                    });
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewTransaction(name: name.toString(), amount: amount.toString(), remarks: remarks.toString(), agntid: agentid.toString())));
                       print(amountcontroller.text);
                    }
                  }, child: Text("Continue", style: TextStyle(color: AppColor.white),),
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColor.primary))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
