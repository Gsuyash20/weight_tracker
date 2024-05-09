import 'package:flutter/material.dart';

import '../components/frosted_glass.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(
          //Todo: add username
          'Hi "username",',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                FrostedGlass(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: const Column(
                      children: [Text('Plot')],

                    ))
              ],
            ),
          ),
          const Text(
            'History',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  //final entry = weightEntry[index];
                  return const Card(
                    child: ListTile(
                      leading: Text(
                        'weightInKg',
                        //'Weight: ${entry.weight.toString()} kg',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        'Time',
                        //'Entry Time: ${entry.entryTime.toString()}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Todo: Navigate to edit weight screen
        },
        tooltip: 'Edit Entry',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
