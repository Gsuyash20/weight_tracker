import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTile extends StatelessWidget {
  final double weightInKg;
  final DateTime entryTime;

  const CardTile({
    super.key,
    required this.weightInKg,
    required this.entryTime,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMM dd').format(entryTime);
    return Card(
      child: ListTile(
        leading: Text(
          '$weightInKg kg',
          style: const TextStyle(fontSize: 18.0),
        ),
        trailing: Text(
          formattedDate,
          style: const TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }
}
