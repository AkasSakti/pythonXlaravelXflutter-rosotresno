import 'package:flutter/material.dart';
import 'package:crud_klasifikasi_cinta/services/api_service.dart';
import 'package:crud_klasifikasi_cinta/models/response.dart';
import 'package:crud_klasifikasi_cinta/screens/response_form.dart';
import 'screens/response_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Klasifikasi Cinta',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ResponseList(),
    );
  }
}

class ResponseListScreen extends StatefulWidget {
  @override
  _ResponseListScreenState createState() => _ResponseListScreenState();
}

class _ResponseListScreenState extends State<ResponseListScreen> {
  late Future<List<ResponseModel>> futureResponses;

  @override
  void initState() {
    super.initState();
    futureResponses = ApiService.getResponses();
  }

  void refreshList() {
    setState(() {
      futureResponses = ApiService.getResponses();
    });
  }

  void deleteResponse(int id) async {
    await ApiService.deleteResponse(id);
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responses List')),
      body: FutureBuilder<List<ResponseModel>>(
        future: futureResponses,
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
              final response = snapshot.data![index];
              return Card(
                child: ListTile(
                  title: Text('User ID: ${response.userId}'),
                  subtitle: Text('Label: ${response.label}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResponseForm(
                                response: response,
                                onSaved: refreshList,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteResponse(response.id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResponseForm(onSaved: refreshList),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
