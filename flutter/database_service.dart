import 'dart:convert';
import 'package:http/http.dart' as http;

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
