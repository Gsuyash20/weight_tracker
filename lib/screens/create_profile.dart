import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/text_field.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  //user sign in
  void signIn() async {
    //get the auth service
    //final authService = Provider.of<AuthService>(context, listen: false);

    try {
      //  await authService.signInWithEmailAndPassword(
      //      emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body:  SafeArea(
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

                  //welcome back message
                  const Text(
                    'Welcome :)',
                    style: TextStyle(fontSize: 24),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // username text field
                  MyTextField(
                      controller: userNameController,
                      hintText: 'Username',
                      obscureText: false),

                  const SizedBox(
                    height: 15,
                  ),

                  // password text field

                  const SizedBox(
                    height: 25,
                  ),

                  //sign-in button

                  const SizedBox(
                    height: 50,
                  ),
                  // Redirect to Sign up screen
                  // Text.rich(
                  //   style: const TextStyle(fontSize: 17),
                  //   TextSpan(text: "Don't have an account? ", children: [
                  //     TextSpan(
                  //       text: 'Sign Up',
                  //       style: const TextStyle(fontWeight: FontWeight.bold),
                  //       recognizer: TapGestureRecognizer()
                  //         ..onTap = widget.onTap,
                  //     ),
                  //   ]),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
