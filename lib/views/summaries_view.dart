import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gys_657_sorubankasi/services/summary_service.dart';

class SummariesView extends StatefulWidget {
  const SummariesView({Key? key}) : super(key: key);

  @override
  State<SummariesView> createState() => _SummariesViewState();
}

class _SummariesViewState extends State<SummariesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Özet Bilgiler'),
      ),
      body: FutureBuilder(
        future: getSummaries(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(
                  snapshot.data[index].ozetBilgi,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                leading: CircleAvatar(
                    child: Text(
                  '${index + 1}',
                  style: const TextStyle(),
                )),
              ),
              separatorBuilder: (context, int index) {
                return const Divider();
              },
            );
          }
        },
      ),
    );
  }
}
