import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',style: TextStyle(fontSize: 24),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30,),
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
            const Expanded(
                child: Text(
              'UserName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )),
            ElevatedButton(
                onPressed: () {}, child: const Text('Delete your data')),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
