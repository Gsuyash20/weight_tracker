import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/components/dialog_box.dart';
import 'package:weight_tracker/components/plot.dart';
import '../components/card_tile.dart';
import '../components/frosted_glass.dart';
import '../data/hive_service.dart';
import '../model/weight_entry.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  HiveService hs = HiveService();
  List<FlSpot> chartData = [];

  @override
  void initState() {
    super.initState();
    _loadChartData();
  }

  // Load initial chart data
  void _loadChartData() async {
    final List<dynamic> entries = await hs.getWeights();
    // Ensure entries are of type WeightEntry
    List<WeightEntry> weightEntries = entries.cast<WeightEntry>();
    setState(() {
      chartData = _generateChartData(weightEntries);
    });
  }

  // Generate chart data from WeightEntry list
  List<FlSpot> _generateChartData(List<WeightEntry> entries) {
    List<FlSpot> data = [];
    for (int i = 0; i < entries.length; i++) {
      data.add(FlSpot(i.toDouble(), entries[i].weight));
    }
    return data;
  }

  // Function to update chart data when a new entry is added
  void _updateChartData() async {
    final List<dynamic> entries = await hs.getWeights();
    // Ensure entries are of type WeightEntry
    List<WeightEntry> weightEntries = entries.cast<WeightEntry>();
    setState(() {
      chartData = _generateChartData(weightEntries);
    });
  }

  void _saveNewEntry() async {
    double? weight = double.tryParse(_controller.text);
    if (weight != null && weight < 120) {
      final weightEntry = WeightEntry(
        username: await hs.getUsername() ?? 'Unknown User',
        weight: weight,
        time: DateTime.now(),
      );
      await hs.addWeight(
        weightEntry.username,
        weightEntry.weight,
        weightEntry.time,
      );
      _updateChartData();
      setState(() {});
      Navigator.of(context).pop(); // Close the dialog
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Weight'),
            content: const Text('Please enter a weight less than 120.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // create a new entry
  void _createNewEntry() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: _saveNewEntry,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FutureBuilder<String?>(
          future: hs.getUsername(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            } else {
              final username = snapshot.data ?? 'Unknown User';
              return Text(
                'Hi $username,',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }
          },
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
                                maxX: chartData.length.toDouble() - 1,
                                minY: 0, // minimum weight = 0
                                maxY: 120, // maximum weight = 120
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: chartData,
                                    isCurved: true,
                                    color: Colors.teal,
                                    barWidth: 3,
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: Colors.teal.withOpacity(0.3),
                                    ),
                                  ),
                                ],
                                titlesData: Titles.getTitleData(),
                              ),
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
            child: FutureBuilder<List<dynamic>>(
              future: hs.getWeights(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final weightEntries = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: weightEntries.length,
                    itemBuilder: (context, index) {
                      final entry = weightEntries[index];
                      return CardTile(
                        weightInKg: entry.weight,
                        entryTime: entry.time,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewEntry,
        tooltip: 'Create Entry',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
