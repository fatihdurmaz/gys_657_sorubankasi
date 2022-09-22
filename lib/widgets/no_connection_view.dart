import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İnternet Bağlantısı Yok'),
      ),
      body: Center(
        child: Container(
          child: Lottie.asset('assets/json/animation.json'),
        ),
      ),
    );
  }
}
