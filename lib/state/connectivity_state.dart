import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

enum NetworkStatus { online, offline }

class ConnectivityState with ChangeNotifier {
  NetworkStatus _status = NetworkStatus.online;

  late StreamSubscription<List<ConnectivityResult>> _subscription;

  NetworkStatus get status => _status;

  ConnectivityState() {
    _checkInitial();

    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      _updateStatus(results);
    });
  }

  Future<void> _checkInitial() async {
    final results = await Connectivity().checkConnectivity();
    _updateStatus(results);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final newStatus = results.contains(ConnectivityResult.none)
        ? NetworkStatus.offline
        : NetworkStatus.online;
    if (_status != newStatus) {
      _status = newStatus;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
