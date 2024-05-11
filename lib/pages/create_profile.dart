import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/my_button.dart';
import '../components/text_field.dart';
import '../data/hive_database.dart';
import '../model/user_profile.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({
    super.key,
  });

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final userNameController = TextEditingController();
  final HiveDatabase _hiveDatabase = HiveDatabase();
  //user signup
  void signUp() async {
    final userProfile = UserProfile(
      userName: userNameController.text,
    );

    await _hiveDatabase.addUserProfile(userProfile);

    //Todo: Navigate to the main page or any other page
  }

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
                    height: 25,
                  ),

                  //sign-up button
                  MyButton(onPressed: signUp, text: 'Sign up'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
