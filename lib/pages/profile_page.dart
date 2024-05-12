import 'package:flutter/material.dart';
import 'package:weight_tracker/pages/create_profile.dart';
import '../data/hive_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HiveService _hiveService = HiveService();

  @override
  void initState() {
    super.initState();
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
              onPressed: () async {
                // Perform deletion and close the dialog
                await _hiveService.deleteAllUserData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateProfilePage()),
                );
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
        automaticallyImplyLeading: false,
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
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(25),
              child: const Icon(
                Icons.person,
                size: 64,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder<String?>(
              future: _hiveService.getUsername(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                } else {
                  final username = snapshot.data ?? 'Unknown User';
                  return Text(
                    username,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showDeleteConfirmationDialog(context);
              },
              child: const Text('Delete your data'),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
