class Summary {
  String? ozetBilgi;

  Summary({this.ozetBilgi});

  Summary.fromJson(Map<String, dynamic> json) {
    ozetBilgi = json['ozet_bilgi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ozet_bilgi'] = this.ozetBilgi;
    return data;
  }
}
