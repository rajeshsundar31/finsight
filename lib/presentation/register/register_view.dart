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
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      Provider.of<RegisterViewModel>(context, listen: false);
    });
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
        Image.asset(AssetsUtils.backfin),
        Padding(
        padding: const EdgeInsets.only(top: 310),
        child: Column(
          children: [
            _buildName(context),
            _buildEmail(context),
            _buildPassword(context),
            _buildButton(context),
            _buildBottomContent(context)
          ],
        ),
      ),
      _buildHeading(context)
      ],
       
    );
  }

  Padding _buildHeading(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 90.0, top: 16.0),
      child: CustomText(
        text: AppStrings.registerDetails,
      ),
    );
  }

  Flexible _buildName(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }

  Flexible _buildEmail(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }

  Flexible _buildPassword(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            if (value == null || value.length < 4) {
              return 'Password cannot be Empty';
            } else if (value.length < 4 || value.length > 12) {
              return 'Password cannot be less than 4 and more than 12';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Consumer<RegisterViewModel>(builder: (context, btnRegister, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: CustomButton(
          color: AppColor.primary,
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
          width: displayWidth(context) / 1.1,
        ),
      );
    });
  }

  Widget _buildBottomContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(children: [
          const TextSpan(
              text: "Already Have a account?",
              style: TextStyle(color: AppColor.black)),
          const WidgetSpan(
              child: SizedBox(
            width: 8.0,
          )),
          TextSpan(
              text: "LogIn",
              style: const TextStyle(color: AppColor.green),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                })
        ])),
      ],
    );
  }
}
