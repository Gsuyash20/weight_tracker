import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/text_field.dart';

class CreateProfilePage extends StatefulWidget {
  // final void Function()? onTap;
  const CreateProfilePage({super.key, });

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //user signup


    //get auth service


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  //logo
                  const FaIcon(
                    FontAwesomeIcons.weightScale,
                    size: 100,
                    color: Colors.blueGrey,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //create account message
                  const Text(
                    "Welcome, Let's Create Your Account",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //username text field
                  MyTextField(
                      controller: userNameController,
                      hintText: 'Username',
                      obscureText: false),

                  const SizedBox(
                    height: 15,
                  ),

                  // email text field
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false),

                  const SizedBox(
                    height: 15,
                  ),

                  // password text field
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true),

                  const SizedBox(
                    height: 15,
                  ),

                  // confirm password text field
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign-up button
                  // SignButton(onTap: signUp, text: 'Sign up'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
