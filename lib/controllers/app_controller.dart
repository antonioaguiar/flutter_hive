import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class AppController with ChangeNotifier {
  List<ConnectivityResult> _conectividade = [];

  String get getConectividade {
    String conn = 'Conexão desconhecida!';
    for (var element in _conectividade) {
      switch (element) {
        case ConnectivityResult.none:
          conn = "Sem conexão com rede internet";
          continue;
        case ConnectivityResult.wifi:
          conn = "Conectado via wifi";
          break;
        case ConnectivityResult.mobile:
          conn = "Conectado via rede mobile";
          break;
        default:
          break;
      }
    }
    return conn;
  }

  set conectividade(List<ConnectivityResult> connectivityResult) {
    _conectividade = connectivityResult;
    notifyListeners();
  }
}
