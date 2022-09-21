import 'package:flutter/material.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İnternet Bağlantısı Yok'),
      ),
      body: const Center(
        child: Text('Bağlantı YOK',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            )),
      ),
    );
  }
}
