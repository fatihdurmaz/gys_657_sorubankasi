import 'package:gys_657_sorubankasi/models/summary.dart';
import 'dart:convert';
import '../constants.dart' as Constant;
import 'package:http/http.dart' as http;

Future<List<Summary>> getSummaries() async {
  String url = "${Constant.apiBaseURL}api/gyud-ozet-bilgiler/q";

  final response = await http.get(
    Uri.parse(url),
  );

  var responseData = json.decode(utf8.decode(response.bodyBytes));

  List<Summary> summaries = [];
  for (var data in responseData) {
    Summary summary = Summary(
      ozetBilgi: data["ozet_bilgi"],
    );
    summaries.add(summary);
  }
  return summaries;
}
