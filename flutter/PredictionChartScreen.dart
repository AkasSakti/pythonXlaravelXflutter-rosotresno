import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class PredictionChartScreen extends StatefulWidget {
  @override
  _PredictionChartScreenState createState() => _PredictionChartScreenState();
}

class _PredictionChartScreenState extends State<PredictionChartScreen> {
  Map<String, int> predictionData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var data = await getPredictionCounts();
      setState(() {
        predictionData = data;
      });
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        predictionData = {}; // Supaya tidak stuck di loading
      });
    }
  }

  Future<Map<String, int>> getPredictionCounts() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/prediction-counts'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        Map<String, int> predictionCounts = {};

        for (var item in data) {
          predictionCounts[item['prediction']] = item['count'];
        }

        return predictionCounts;
      } else {
        throw Exception("Failed to load prediction counts");
      }
    } catch (e) {
      print("API error: $e");
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prediction Chart")),
      body: predictionData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  barGroups: predictionData.entries.map((entry) {
                    return BarChartGroupData(
                      x: entry.key == 'Jatuh Cinta' ? 0 : 1,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value.toDouble(),
                          color: entry.key == 'Jatuh Cinta' ? Colors.red : Colors.blue,
                          width: 30,
                        ),
                      ],
                    );
                  }).toList(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Jatuh Cinta');
                            case 1:
                              return Text('Tidak Jatuh Cinta');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
