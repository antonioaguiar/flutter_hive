import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testehive/models/escolas_model.dart';

class EscolasProviders extends ChangeNotifier {
  //

  void addEscola(String id, String nome, String municipio) {
    EscolasModel escolasModel = EscolasModel(id, nome, municipio);
    final box = Hive.box<EscolasModel>('escolas');
    box.put(id, escolasModel);

    notifyListeners();
  }

  void removeEscola(String id) {
    final box = Hive.box<EscolasModel>('escolas');
    box.delete(id);
    notifyListeners();
  }

  List<EscolasModel> getEscolas() {
    final box = Hive.box<EscolasModel>('escolas');
    return box.values.toList();
  }

  List<EscolasModel> getEscola(String nome) {
    final box = Hive.box<EscolasModel>('escolas');
    return box.values.where((escola) => escola.nome == nome).toList();
  }
}
