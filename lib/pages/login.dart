import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/User.dart';
import '../store/store.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var token = (VxState.store as MyStore).token;
  // var user = (VxState.store as MyStore).user;
  final _formkey = GlobalKey<FormState>();

  final emailConroller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailConroller.dispose();
    passwordController.dispose();

    super.dispose();
  }


  moveToHome(BuildContext context) async {
    emailConroller.text = 'imsamimalikk@gmail.com';
    passwordController.text = 'imsamimalik';
    if (_formkey.currentState!.validate()) {
      var formData = FormData.fromMap({
        'email': emailConroller.text,
        'password': passwordController.text,
      });

      try {
        var response = await CONSTANTS.DIO.post(
          '/login',
          data: formData,
        );
        if (response.statusCode == 200) {
          LoginUser(response.data['token']);
          PopulateUser(
            response.data['user']
            );
          

          if (!mounted) return;
         await Navigator.pushNamedAndRemoveUntil(
              context, MyRoutes.home, (Route<dynamic> route) => false);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: context.theme.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(children: [
              Image.asset("assets/images/loginHero.png", fit: BoxFit.cover),
              const SizedBox(height: 20),
              const Text("Welcome",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: emailConroller,
                        decoration: const InputDecoration(
                            hintText: 'Enter email', labelText: 'Email'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty.";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Enter password', labelText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Passowrd cannot be empty.";
                        } else if (value.length < 6) {
                          return 'Passowrd should be at least 6 characters.';
                        }
                        return null;
                      },
                    ),
                  ],
                ).p12(),
              ),
              20.heightBox,
              Material(
                color: context.theme.floatingActionButtonTheme.backgroundColor,
                borderRadius: BorderRadius.circular(9),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 150,
                    height: 50,
                    child:
                        // : 'Login'.text.bold.size(18).white.makeCentered(),
                        const Icon(Icons.fingerprint_outlined,
                            color: Colors.white, size: 32),
                  ),
                ),
              ),
                            20.heightBox,
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.register);
                },
                child: 'nned an account? Register'.text.makeCentered(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
