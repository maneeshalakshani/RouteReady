import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/routes/routes.gr.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APP_COLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: DEFAULT_BIG_TITLE_SIZE,
                fontWeight: FontWeight.bold,
                color: DARK_PURPLE,
              ),
            ),
            RoundButton(
              text: "Next",
              onPressed: () => context.router.push(const MainRoute()),
            )
          ],
        ),
      ),
    );
  }
}