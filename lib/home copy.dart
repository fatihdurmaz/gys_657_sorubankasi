import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gys_657_sorubankasi/exam_view.dart';
import 'package:gys_657_sorubankasi/no_connection_view.dart';
import 'package:gys_657_sorubankasi/subject_view.dart';
import 'package:gys_657_sorubankasi/summaries_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  int _selectedIndex = 0;
  bool? check;
  final pages = [
    const SubjectView(),
    const ExamView(),
    const SummariesView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      if (_connectionStatus.toString() == 'ConnectivityResult.none') {
        check = false;
      } else {
        check = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: check! ? pages[_selectedIndex] : const NoConnectionView(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Konu Çalış',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Soru Çöz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Özet Bilgiler',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
