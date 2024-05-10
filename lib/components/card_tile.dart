import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
