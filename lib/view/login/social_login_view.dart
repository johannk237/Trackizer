import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../widgets/my_button.dart';
import 'sign_up_view.dart';

class SocialLoginView extends StatefulWidget {
  const SocialLoginView({super.key});

  @override
  State<SocialLoginView> createState() => _SocialLoginViewState();
}

class _SocialLoginViewState extends State<SocialLoginView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
        backgroundColor: TColor.gray80,
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
                Text(
                  "Welcome to our App",
                  style: TextStyle(color: TColor.white, fontSize: 14),
                ),
                const SizedBox(height: 30),
                MyButton(
                  title: "Sign up with Apple",
                  image: "assets/icon/Apple.png",
                  color: TColor.gray,
                  textColor: TColor.white,
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                MyButton(
                  title: "Sign up with Google",
                  image: "assets/icon/Google.png",
                  color: TColor.white,
                  textColor: TColor.gray,
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                MyButton(
                  title: "Sign up with Facebook",
                  image: "assets/icon/Facebook.png",
                  color: Colors.blue,
                  textColor: TColor.white,
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                Text(
                  "Or",
                  style: TextStyle(color: TColor.white, fontSize: 14),
                ),
                const SizedBox(height: 30),
                MyButton(
                  title: "Sign up with E-mail",
                  image: "",
                  color: TColor.primary,
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
        ));
  }
}
