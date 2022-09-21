import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
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
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  int _selectedIndex = 0;
  bool check = false;
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

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      connectivityResult = result;
      if (connectivityResult.toString() == 'ConnectivityResult.none') {
        check = false;
      } else {
        check = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: check ? pages[_selectedIndex] : const NoConnectionView(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Konu Çalış',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Soru Çöz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Özet Bilgiler',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
