class Summary {
  String? ozetBilgi;

  Summary({this.ozetBilgi});

  Summary.fromJson(Map<String, dynamic> json) {
    ozetBilgi = json['ozet_bilgi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ozet_bilgi'] = ozetBilgi;
    return data;
  }
}
