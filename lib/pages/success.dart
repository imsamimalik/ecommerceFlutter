import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({
    super.key,
  });

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  var timer;

  backToHome() {
    Navigator.of(context).popAndPushNamed(MyRoutes.home);
  }

  redirect() async {
    if (!mounted) return;
    timer = Timer(
      const Duration(seconds: 5),
      () {
        backToHome();
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              "Order# ${routes['orderNo']} Placed!"
                  .text
                  .xl3
                  .color(context.theme.primaryColor)
                  .makeCentered(),
              50.heightBox,
              Image.asset('assets/images/success.png'),
              60.heightBox,
              "You will be redirected to the home page in 5 seconds."
                  .text
                  .makeCentered(),
              60.heightBox,
              ElevatedButton(
                onPressed: () => backToHome(),
                style: ElevatedButton.styleFrom(
                  primary:
                      context.theme.floatingActionButtonTheme.backgroundColor,
                  shape: const StadiumBorder(),
                ),
                child: 'Back to home'
                    .text
                    .bold
                    .color(context.theme.canvasColor)
                    .make(),
              ).wh(200, 50)
            ],
          ).py64(),
        ).p32(),
      ),
    );
  }
}
