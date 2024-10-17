import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../widgets/my_button.dart';
import '../../widgets/round_text_field.dart';
import '../main_tab/main_tab_view.dart';
import 'sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  bool isRemember = false;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isRemember
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_outlined,
                          size: 20,
                          color: TColor.gray50,
                        ),
                        const SizedBox(width: 8),
                        Text("Remember me",
                            style:
                                TextStyle(color: TColor.gray50, fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot password",
                        style: TextStyle(color: TColor.gray50, fontSize: 14)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              MyButton(
                title: "Sign in",
                image: "",
                color: TColor.primary,
                textColor: TColor.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainTabView()));
                },
              ),
              const Spacer(),
              Text(
                "Don't you already have an account ?",
                style: TextStyle(color: TColor.white, fontSize: 14),
              ),
              const SizedBox(height: 20),
              MyButton(
                title: "Sign up",
                image: "",
                color: TColor.gray60,
                textColor: TColor.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpView()));
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
