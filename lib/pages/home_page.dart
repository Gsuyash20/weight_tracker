import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/components/dialog_box.dart';
import 'package:weight_tracker/components/plot.dart';
import '../components/card_tile.dart';
import '../components/frosted_glass.dart';
import '../data/hive_database.dart';
import '../model/weight_entry.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  late final HiveDatabase _hiveDatabase;
  @override
  void initState() {
    super.initState();
    _hiveDatabase = HiveDatabase();
  }
  //save new entry
  void saveNewEntry() async {
    final weightEntry = WeightEntry(
        weightInKg: double.parse(_controller.text), entryTime: DateTime.now());
    await _hiveDatabase.addWeightEntry(weightEntry);
    Navigator.of(context).pop(); // Close the dialog
  }

  // create a new entry
  void createNewEntry() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewEntry,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
                    child: Column(
                      children: [
                        const Text(
                          'Plot',
                          style: TextStyle(fontSize: 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: LineChart(
                              LineChartData(
                                  minX: 0,
                                  maxX: 11,
                                  minY: 30, // minimum weight = 30
                                  maxY: 120, //maximum weight = 120
                                  lineBarsData: [
                                    LineChartBarData(
                                        spots: const [
                                          FlSpot(0, 39),
                                          FlSpot(1, 50),
                                          FlSpot(2, 69),
                                          FlSpot(3, 89),
                                          FlSpot(4, 45),
                                          FlSpot(5, 87),
                                          FlSpot(6, 110),
                                          FlSpot(7, 109),
                                          FlSpot(8, 40),
                                          FlSpot(9, 69),
                                          FlSpot(10, 99),
                                          FlSpot(11, 115),
                                        ],
                                        isCurved: true,
                                        color: Colors.teal,
                                        barWidth: 3,
                                        belowBarData: BarAreaData(
                                            show: true,
                                            color:
                                                Colors.teal.withOpacity(0.3)))
                                  ],
                                  titlesData: Titles.getTitleData()),
                            ),
                          ),
                        )
                      ],
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
              itemCount: _hiveDatabase.getWeightEntries().length,
              itemBuilder: (context, index) {
                final entry = _hiveDatabase.getWeightEntries()[index];
                return CardTile(
                  weightInKg: entry.weightInKg,
                  entryTime: entry.entryTime,
                );
              },
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewEntry,
        tooltip: 'Create Entry',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
