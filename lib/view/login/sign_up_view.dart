import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/round_text_field.dart';
import 'sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: media.height * 0.05),
              Image.asset(
                "assets/logo/logo.png",
                width: media.width * 0.5,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              RoundTextField(
                title: "E-mail address",
                controller: textEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                title: "Password",
                controller: textPassword,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                title: "Confirm password",
                controller: textPassword,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(color: TColor.gray70),
                  )),
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(color: TColor.gray70),
                  )),
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(color: TColor.gray70),
                  )),
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(color: TColor.gray70),
                  )),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                  "Use 8 or more characters with a mix of letters,\nnumbers & symbols",
                  style: TextStyle(color: TColor.gray50, fontSize: 14)),
              const SizedBox(height: 8),
              PrimaryButton(
                title: "Get started, it's free!",
                image: "",
                color: TColor.primary,
                textColor: TColor.white,
                onPressed: () {},
              ),
              const Spacer(),
              Text(
                "Do you already have an account ?",
                style: TextStyle(color: TColor.white, fontSize: 14),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                title: "Sign in",
                image: "",
                color: TColor.gray60,
                textColor: TColor.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
