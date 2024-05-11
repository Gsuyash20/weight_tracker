import 'package:flutter/material.dart';

import '../data/hive_database.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HiveDatabase _hiveDatabase = HiveDatabase();
  late String _username;
  @override
  void initState() {
    super.initState();
    _username =_hiveDatabase.getUsername();
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Are you sure you want to delete your data?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform deletion and close the dialog
                _hiveDatabase.deleteAllUserData();
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(24)),
              padding: const EdgeInsets.all(25),
              child: const Icon(
                Icons.person,
                size: 64,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
             Expanded(
                child: Text(
              _username,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )),
            ElevatedButton(
                onPressed: () {
                  _showDeleteConfirmationDialog(context);
                },
                child: const Text('Delete your data')),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
