import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var token = (VxState.store as MyStore).token;
  // var user = (VxState.store as MyStore).user;
  final _formkey = GlobalKey<FormState>();

  final emailConroller = TextEditingController();
  final passwordController = TextEditingController();
  final passConfirmController = TextEditingController();
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailConroller.dispose();
    passwordController.dispose();
    passConfirmController.dispose();
    usernameController.dispose();
    nameController.dispose();
    addressController.dispose();

    super.dispose();
  }

  registerUser(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      var formData = FormData.fromMap({
        'email': emailConroller.text,
        'password': passwordController.text,
        'name': nameController.text,
        'address': addressController.text,
        'username': usernameController.text,
        'walletBalance': 100000,
        'password_confirmation': passwordController.text
      });

      try {
        var response = await CONSTANTS.DIO.post(
          '/register',
          data: formData,
        );
        if (response.statusCode == 201) {
          if (!mounted) return;
          await Navigator.pushNamedAndRemoveUntil(
              context, MyRoutes.login, (Route<dynamic> route) => false);
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
              Image.asset("assets/images/registerHero.png", fit: BoxFit.cover),
              const SizedBox(height: 20),
              const Text("Register",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    VxTextField(
                      fillColor: Colors.transparent,
                      hint: 'Enter your email',
                      labelText: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty.";
                        }
                        return null;
                      },
                    ),
                    VxTextField(
                      controller: nameController,
                      fillColor: Colors.transparent,
                      hint: 'Enter your fullname',
                      labelText: 'Fullname',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Full name cannot be empty.";
                        }
                        return null;
                      },
                    ),
                    VxTextField(
                      controller: usernameController,
                      fillColor: Colors.transparent,
                      hint: 'Enter your username',
                      labelText: 'Username',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty.";
                        }
                        return null;
                      },
                    ),
                    VxTextField(
                      controller: passwordController,
                      obscureText: true,
                      isPassword: true,
                      fillColor: Colors.transparent,
                      hint: 'Enter your password',
                      labelText: 'Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Passowrd cannot be empty.";
                        } else if (value.length < 6) {
                          return 'Passowrd should be at least 6 characters.';
                        }
                        return null;
                      },
                    ),
                    VxTextField(
                      controller: passwordController,
                      obscureText: true,
                      isPassword: true,
                      fillColor: Colors.transparent,
                      hint: 'Confirm your password',
                      labelText: 'Confirm Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Passowrd cannot be empty.";
                        } else if (value != passwordController.text) {
                          return 'Password Mismatch.';
                        }
                        return null;
                      },
                    ),
                    VxTextField(
                      controller: addressController,
                      fillColor: Colors.transparent,
                      hint: 'Enter your address',
                      labelText: 'Address',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address cannot be empty.";
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
                  onTap: () => registerUser(context),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 150,
                    height: 50,
                    child:
                        // : 'Login'.text.bold.size(18).white.makeCentered(),
                        const Icon(Icons.person_add,
                            color: Colors.white, size: 32),
                  ),
                ),
              ),
              20.heightBox,
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.login);
                },
                child: 'already have an account? Log in'.text.makeCentered(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
