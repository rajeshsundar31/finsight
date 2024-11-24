import 'package:finsight/component/custom_button.dart';
import 'package:finsight/core/constants/app_colors.dart';
import 'package:finsight/core/constants/app_strings.dart';
import 'package:finsight/core/utils/app_size.dart';
import 'package:finsight/core/utils/asset_utils.dart';
import 'package:finsight/presentation/login/login_view_model.dart';
import 'package:finsight/presentation/register/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _buildBody(context),
    ));
  }

  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: displayWidth(context) / 1.2,
        child: TextFormField(
          decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter Your Email",
              border: OutlineInputBorder()),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email';
            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null; // Return null if no error
          },
          onChanged: (value) {
            email = value;
          },
        ),
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: displayWidth(context) / 1.2,
        child: TextFormField(
          decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter Your Password",
              border: OutlineInputBorder()),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter valid password';
            } else if (value.length < 4) {
              return 'Please enter a valid password';
            }
            return null; // Return null if no error
          },
          onChanged: (value) {
            password = value;
          },
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, btnLogin, child) {
      return Column(
        children: [
          CustomButton(
            color: AppColor.btn_green,
            text: AppStrings.continueBtn,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                btnLogin.validateLogin(
                    email: email!, password: password!, context: context);
              }
            },
            width: displayWidth(context) / 1.3,
          )
        ],
      );
    });
  }

  Widget _buildBottomContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(children: [
            const TextSpan(
                text: "Don't Have a Account ?",
                style: TextStyle(color: AppColor.black)),
            const WidgetSpan(
                child: SizedBox(
              width: 8.0,
            )),
            TextSpan(
                text: "Register",
                style: const TextStyle(color: AppColor.green),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterUser()));
                })
          ])),
        ],
      ),
    );
  }

  Widget _buildContainer(context) {
    return Container(
      width: displayWidth(context),
      height: displayHeight(context) * 0.42,
      decoration: const BoxDecoration(
        // color: AppColor.btn_green,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
      ),
      child: Image.asset(AssetsUtils.payColor)
    );
  }

  Widget _buildContent(context){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmail(context),
          _buildPassword(context),
          _buildButton(context),
          _buildBottomContent(context),
        ],
      )
      );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildContainer(context),
        _buildContent(context)
      ],
    );
  }
}
