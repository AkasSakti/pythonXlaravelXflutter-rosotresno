class ResponseModel {
  int? id;
  int userId;
  String seringMemikirkan;
  int? merasaBahagia;
  String cemburu;
  int? nyamanBerbicara;
  String seringChat;
  String mencariKesempatan;
  int? perhatian;
  String frekuensiNyebut;
  String jantungBerdebar;
  String seringMenatap;
  String gugup;
  String senyumSaatDengarNama;
  String membayangkanMasaDepan;
  int? prioritas;
  String mudahMemaafkan;
  int? kehilanganMotivasi;
  String label;

  ResponseModel({
    this.id,
    required this.userId,
    required this.seringMemikirkan,
    this.merasaBahagia,
    required this.cemburu,
    this.nyamanBerbicara,
    required this.seringChat,
    required this.mencariKesempatan,
    this.perhatian,
    required this.frekuensiNyebut,
    required this.jantungBerdebar,
    required this.seringMenatap,
    required this.gugup,
    required this.senyumSaatDengarNama,
    required this.membayangkanMasaDepan,
    this.prioritas,
    required this.mudahMemaafkan,
    this.kehilanganMotivasi,
    required this.label,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      id: json['id'],
      userId: json['user_id'],
      seringMemikirkan: json['sering_memikirkan'],
      merasaBahagia: json['merasa_bahagia'],
      cemburu: json['cemburu'],
      nyamanBerbicara: json['nyaman_berbicara'],
      seringChat: json['sering_chat'],
      mencariKesempatan: json['mencari_kesempatan'],
      perhatian: json['perhatian'],
      frekuensiNyebut: json['frekuensi_nyebut'],
      jantungBerdebar: json['jantung_berdebar'],
      seringMenatap: json['sering_menatap'],
      gugup: json['gugup'],
      senyumSaatDengarNama: json['senyum_saat_dengar_nama'],
      membayangkanMasaDepan: json['membayangkan_masa_depan'],
      prioritas: json['prioritas'],
      mudahMemaafkan: json['mudah_memaafkan'],
      kehilanganMotivasi: json['kehilangan_motivasi'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'sering_memikirkan': seringMemikirkan,
      'merasa_bahagia': merasaBahagia,
      'cemburu': cemburu,
      'nyaman_berbicara': nyamanBerbicara,
      'sering_chat': seringChat,
      'mencari_kesempatan': mencariKesempatan,
      'perhatian': perhatian,
      'frekuensi_nyebut': frekuensiNyebut,
      'jantung_berdebar': jantungBerdebar,
      'sering_menatap': seringMenatap,
      'gugup': gugup,
      'senyum_saat_dengar_nama': senyumSaatDengarNama,
      'membayangkan_masa_depan': membayangkanMasaDepan,
      'prioritas': prioritas,
      'mudah_memaafkan': mudahMemaafkan,
      'kehilangan_motivasi': kehilanganMotivasi,
      'label': label,
    };
  }

static List<String> getFields() {
    return [
      'sering_memikirkan', 'merasa_bahagia', 'cemburu', 'nyaman_berbicara', 'sering_chat',
      'mencari_kesempatan', 'perhatian', 'frekuensi_nyebut', 'jantung_berdebar',
      'sering_menatap', 'gugup', 'senyum_saat_dengar_nama', 'membayangkan_masa_depan',
      'prioritas', 'mudah_memaafkan', 'kehilangan_motivasi', 'label'
    ];
  }

  dynamic getValue(String field) {
    return toJson()[field];
  }

  void setValue(String field, dynamic value) {
    switch (field) {
      case 'sering_memikirkan': seringMemikirkan = value; break;
      case 'merasa_bahagia': merasaBahagia = value; break;
      case 'cemburu': cemburu = value; break;
      case 'nyaman_berbicara': nyamanBerbicara = value; break;
      case 'sering_chat': seringChat = value; break;
      case 'mencari_kesempatan': mencariKesempatan = value; break;
      case 'perhatian': perhatian = value; break;
      case 'frekuensi_nyebut': frekuensiNyebut = value; break;
      case 'jantung_berdebar': jantungBerdebar = value; break;
      case 'sering_menatap': seringMenatap = value; break;
      case 'gugup': gugup = value; break;
      case 'senyum_saat_dengar_nama': senyumSaatDengarNama = value; break;
      case 'membayangkan_masa_depan': membayangkanMasaDepan = value; break;
      case 'prioritas': prioritas = value; break;
      case 'mudah_memaafkan': mudahMemaafkan = value; break;
      case 'kehilangan_motivasi': kehilanganMotivasi = value; break;
      case 'label': label = value; break;
    }
  }

}