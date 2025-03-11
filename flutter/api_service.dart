import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/response.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/responses';

  static Future<List<ResponseModel>> getResponses() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => ResponseModel.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load responses');
    }
  }

 static Future<void> createResponse(ResponseModel response) async {
  final responseApi = await http.post(
    Uri.parse(baseUrl),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(response.toJson()),
  );

  if (responseApi.statusCode != 201) {
    throw Exception('Gagal menambahkan data: ${responseApi.body}');
  }
}

  static Future<void> updateResponse(ResponseModel response) async {
  final responseApi = await http.put(
    Uri.parse('$baseUrl/${response.id}'),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(response.toJson()),
  );

  if (responseApi.statusCode != 200) {
    throw Exception('Gagal memperbarui data: ${responseApi.body}');
  }
}

  static Future<void> deleteResponse(int id) async {
    final responseApi = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (responseApi.statusCode != 200) {
      throw Exception('Gagal menghapus data: ${responseApi.body}');
    }
  }
}
