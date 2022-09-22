import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gys_657_sorubankasi/summary.dart';
import 'package:http/http.dart' as http;

class SummariesView extends StatefulWidget {
  const SummariesView({Key? key}) : super(key: key);

  @override
  State<SummariesView> createState() => _SummariesViewState();
}

class _SummariesViewState extends State<SummariesView> {
  Future<List<Summary>> getRequest() async {
    String url = "https://webapi.yuumamobile.com/api/gyud-ozet-bilgiler/q";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Özet Bilgiler'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(
                    snapshot.data[index].ozetBilgi,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  leading: const Icon(Icons.star),
                ),
                separatorBuilder: (context, int index) {
                  return const Divider(
                    color: Colors.black,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
