import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/response_model.dart';

class ResponseEditScreen extends StatefulWidget {
  final ResponseModel response;

  ResponseEditScreen({required this.response});

  @override
  _ResponseEditScreenState createState() => _ResponseEditScreenState();
}

class _ResponseEditScreenState extends State<ResponseEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  late TextEditingController _userIdController;
  late String _seringMemikirkan;

  @override
  void initState() {
    super.initState();
    _userIdController = TextEditingController(text: widget.response.userId.toString());
    _seringMemikirkan = widget.response.seringMemikirkan;
  }

  // Simpan perubahan
  void _updateResponse() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> updatedData = {
        'user_id': int.parse(_userIdController.text),
        'sering_memikirkan': _seringMemikirkan,
      };

      await _apiService.updateResponse(widget.response.id, updatedData);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Response')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'User ID'),
                validator: (value) => value!.isEmpty ? 'Masukkan User ID' : null,
              ),
              DropdownButtonFormField(
                value: _seringMemikirkan,
                items: ['Ya', 'Tidak'].map((value) => DropdownMenuItem(child: Text(value), value: value)).toList(),
                onChanged: (value) => setState(() => _seringMemikirkan = value.toString()),
                decoration: InputDecoration(labelText: 'Sering Memikirkan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _updateResponse, child: Text('Update')),
            ],
          ),
        ),
      ),
    );
  }
}
