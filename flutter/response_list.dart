import 'package:flutter/material.dart';
import '../models/response.dart';
import '../services/api_service.dart';
import 'response_form.dart';
import 'PredictionChartScreen.dart'; // Import halaman chart

class ResponseList extends StatefulWidget {
  @override
  _ResponseListState createState() => _ResponseListState();
}

class _ResponseListState extends State<ResponseList> {
  late Future<List<ResponseModel>> futureResponses;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void refreshData() {
    setState(() {
      futureResponses = ApiService.getResponses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responses-Roso Tresno')),
      body: FutureBuilder<List<ResponseModel>>(
        future: futureResponses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No responses found'));
          }
          
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final response = snapshot.data![index];
              return ListTile(
                title: Text('User ID: ${response.userId}'),
                subtitle: Text('Label: ${response.label}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResponseForm(
                              response: response,
                              onSaved: refreshData,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await ApiService.deleteResponse(response.id!);
                        refreshData();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btnChart",
            child: Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PredictionChartScreen()),
              );
            },
          ),
          SizedBox(height: 10), // Jarak antara tombol
          FloatingActionButton(
            heroTag: "btnAdd",
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResponseForm(onSaved: refreshData),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
