import 'package:flutter/material.dart';
import 'package:crud_klasifikasi_cinta/models/response.dart';
import 'package:crud_klasifikasi_cinta/services/api_service.dart';

class ResponseForm extends StatefulWidget {
  final ResponseModel? response;
  final VoidCallback onSaved;

  ResponseForm({this.response, required this.onSaved});

  @override
  _ResponseFormState createState() => _ResponseFormState();
}

class _ResponseFormState extends State<ResponseForm> {
  final _formKey = GlobalKey<FormState>();
  late ResponseModel response;

  @override
  void initState() {
    super.initState();
    response = widget.response ?? ResponseModel(
      userId: 0,
      seringMemikirkan: 'Tidak',
      merasaBahagia: 0,
      cemburu: 'Tidak',
      nyamanBerbicara: 0,
      seringChat: 'Tidak',
      mencariKesempatan: 'Tidak',
      perhatian: 0,
      frekuensiNyebut: 'Jarang',
      jantungBerdebar: 'Tidak',
      seringMenatap: 'Tidak',
      gugup: 'Tidak',
      senyumSaatDengarNama: 'Tidak',
      membayangkanMasaDepan: 'Tidak',
      prioritas: 0,
      mudahMemaafkan: 'Tidak',
      kehilanganMotivasi: 0,
      label: 'Tidak Jatuh Cinta',
    );
  }

  void saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        if (widget.response == null) {
          await ApiService.createResponse(response);
        } else {
          await ApiService.updateResponse(response);
        }
        widget.onSaved();
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.response == null ? 'Tambah Response' : 'Edit Response')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: response.userId.toString(),
                decoration: InputDecoration(labelText: 'User ID'),
                keyboardType: TextInputType.number,
                onSaved: (value) => response.userId = int.parse(value!),
              ),
              ...[
                'seringMemikirkan', 'cemburu', 'seringChat', 'mencariKesempatan', 'jantungBerdebar', 'seringMenatap', 'gugup', 'senyumSaatDengarNama', 'membayangkanMasaDepan', 'mudahMemaafkan'
              ].map((field) {
                return DropdownButtonFormField(
                  value: response.toJson()[field],
                  items: ['Ya', 'Tidak'].map((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (newValue) => setState(() => response.toJson()[field] = newValue!),
                  decoration: InputDecoration(labelText: field.replaceAll('_', ' ').toUpperCase()),
                );
              }).toList(),
              ...[
                'merasaBahagia', 'nyamanBerbicara', 'perhatian', 'prioritas', 'kehilanganMotivasi'
              ].map((field) {
                return TextFormField(
                  initialValue: response.toJson()[field]?.toString(),
                  decoration: InputDecoration(labelText: field.replaceAll('_', ' ').toUpperCase()),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => response.toJson()[field] = int.tryParse(value ?? '0'),
                );
              }).toList(),
              DropdownButtonFormField(
                value: response.frekuensiNyebut,
                items: ['Jarang', 'Sedang', 'Sering'].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) => setState(() => response.frekuensiNyebut = newValue!),
                decoration: InputDecoration(labelText: 'Frekuensi Nyebut'),
              ),
              DropdownButtonFormField(
                value: response.label,
                items: ['Jatuh Cinta', 'Tidak Jatuh Cinta'].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) => setState(() => response.label = newValue!),
                decoration: InputDecoration(labelText: 'Label'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveForm,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
