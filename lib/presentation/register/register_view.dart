import 'package:finsight/component/custom_button.dart';
import 'package:finsight/component/custom_text.dart';
import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/constants/app_strings.dart';
import 'package:finsight/core/utils/app_size.dart';
import 'package:finsight/core/utils/asset_utils.dart';
import 'package:finsight/presentation/login/login_view.dart';
import 'package:finsight/presentation/register/register_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  String? name = "";
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<RegisterViewModel>(context, listen: false);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: _buildContainer(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Image.asset(AssetsUtils.payment),
        ),
        Column(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.40,
              child: const Center(
                child: CustomText(
                  text: "Register User",
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                  height: displayHeight(context) * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildName(context),
                      _buildEmail(context),
                      _buildPassword(context),
                      _buildButton(context),
                      _buildBottomContent(context)
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }

    Widget _buildName(BuildContext context) {
    return SizedBox(
      width: displayWidth(context) / 1.2,
      child: TextFormField(
        key: const Key('name'),
        validator: (value) {
          if (value == null || value.length < 4) {
            return 'Please Enter valid Name';
          } else {
            return null;
          }
        },
        onChanged: (value) {
          name = value;
        },
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Your Valid Name",
            labelText: "Name"),
      ),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return SizedBox(
      width: displayWidth(context) / 1.2,
      child: TextFormField(
        key: const Key('email'),
        controller: emailContoller,
        validator: (value) {
          if (value == null || value.length < 4) {
            return 'Please Enter valid Mail Addess';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Your Valid Mail",
            labelText: "Email"),
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return SizedBox(
      width: displayWidth(context) / 1.2,
      child: TextFormField(
        key: const Key('password'),
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Strong Password",
            labelText: "Password"),
        validator: (value) {
          if (value == null) {
            return 'Password cannot be Empty';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Consumer<RegisterViewModel>(builder: (context, btnRegister, child) {
      return Column(
        children: [
          CustomButton(
            color: AppColor.btn_green,
            text: AppStrings.continueBtn,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                btnRegister.saveUserDetails(
                    email: emailContoller.text,
                    password: passwordController.text,
                    userName: name.toString(),
                    context: context);
              }
            },
            width: displayWidth(context) / 1.3,
          )
        ],
      );
    });
  }

  Widget _buildBottomContent(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(text: TextSpan(
          children: [
            const TextSpan(text: "Already Have a account?",style: TextStyle(color: AppColor.black)),
            const WidgetSpan(child: SizedBox(width: 8.0,)),
            TextSpan(text: "LogIn",style: const TextStyle(color: AppColor.green), 
            recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
            }
            )
          ]
        )),
      ],
    );
  }
}
