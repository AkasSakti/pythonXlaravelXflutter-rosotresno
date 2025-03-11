import 'package:flutter/material.dart';
import '../models/response_model.dart';
import '../services/api_service.dart';

class ResponseListScreen extends StatefulWidget {
  @override
  _ResponseListScreenState createState() => _ResponseListScreenState();
}

class _ResponseListScreenState extends State<ResponseListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<ResponseModel>> _futureResponses;

  @override
  void initState() {
    super.initState();
    _futureResponses = _apiService.fetchResponses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responses')),
      body: FutureBuilder<List<ResponseModel>>(
        future: _futureResponses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              ResponseModel response = snapshot.data![index];
              return ListTile(
                title: Text('User ID: ${response.userId}'),
                subtitle: Text('Label: ${response.label}'),
                onTap: () {
                  // Tambahkan navigasi ke detail jika diperlukan
                },
              );
            },
          );
        },
      ),
    );
  }
}
