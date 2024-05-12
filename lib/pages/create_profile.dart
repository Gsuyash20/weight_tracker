import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/my_button.dart';
import '../components/text_field.dart';
import '../data/hive_service.dart';
import 'main_page.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({
    super.key,
  });

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

final HiveService _hiveService = HiveService();
final TextEditingController userNameController = TextEditingController();
final TextEditingController weightController = TextEditingController();

class _CreateProfilePageState extends State<CreateProfilePage> {
  // User signup
  void signUp() async {
    String username = userNameController.text;
    double weight = double.parse(weightController
        .text); // Assuming weight is entered as a string and needs parsing

    if (username.isNotEmpty && weight > 0 && weight <= 120) {
      await _hiveService.addWeight(username, weight, DateTime.now());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
      userNameController.clear();
      weightController.clear();
    } else {
      // Show error or prompt user to enter all required fields
      AlertDialog(
        title: const Text('Alert'),
        content: const Text(
            'Please enter all fields and weight should be less than 120'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
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

                  // Logo
                  const FaIcon(
                    FontAwesomeIcons.weightScale,
                    size: 100,
                    color: Colors.blueGrey,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // Create account message
                  const Text(
                    "Welcome, Let's Create Your Account",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // Username text field
                  MyTextField(
                    controller: userNameController,
                    hintText: 'Username',
                    obscureText: false,
                    keyBoardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    controller: weightController,
                    hintText: 'Enter Weight',
                    obscureText: false,
                    keyBoardType: TextInputType.number,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // Sign-up button
                  MyButton(
                    onPressed: signUp,
                    text: 'Sign Up',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
