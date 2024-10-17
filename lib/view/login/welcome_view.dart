import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extension.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import 'sign_in_view.dart';
import 'social_login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/image/welcome_screen.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
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
                   SizedBox(height: media.height * 0.03),
                  PrimaryButton(
                    title: "Get Started",
                    image: "",
                    color: TColor.primary,
                    textColor: TColor.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SocialLoginView()));
                    },
                  ),
                   SizedBox(height: media.height * 0.03),
                  SecondaryButton(
                    title: "I have an account",
                    image: "",
                    color: TColor.secondary,
                    textColor: TColor.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInView()));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
