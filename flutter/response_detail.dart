import 'package:flutter/material.dart';
import '../models/response_model.dart';
import '../services/api_service.dart';

class ResponseDetailScreen extends StatelessWidget {
  final int responseId;

  ResponseDetailScreen({required this.responseId});

  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Response Detail')),
      body: FutureBuilder<ResponseModel>(
        future: _apiService.fetchResponseById(responseId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Response not found'));
          }

          ResponseModel response = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User ID: ${response.userId}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Sering Memikirkan: ${response.seringMemikirkan}'),
                Text('Merasa Bahagia: ${response.merasaBahagia}'),
                Text('Cemburu: ${response.cemburu}'),
                Text('Nyaman Berbicara: ${response.nyamanBerbicara}'),
                Text('Sering Chat: ${response.seringChat}'),
                Text('Mencari Kesempatan: ${response.mencariKesempatan}'),
                Text('Perhatian: ${response.perhatian}'),
                Text('Frekuensi Nyebut: ${response.frekuensiNyebut}'),
                Text('Jantung Berdebar: ${response.jantungBerdebar}'),
                Text('Sering Menatap: ${response.seringMenatap}'),
                Text('Gugup: ${response.gugup}'),
                Text('Senyum Saat Dengar Nama: ${response.senyumSaatDengarNama}'),
                Text('Membayangkan Masa Depan: ${response.membayangkanMasaDepan}'),
                Text('Prioritas: ${response.prioritas}'),
                Text('Mudah Memaafkan: ${response.mudahMemaafkan}'),
                Text('Kehilangan Motivasi: ${response.kehilanganMotivasi}'),
                Text('Label: ${response.label}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
          );
        },
      ),
    );
  }
}
