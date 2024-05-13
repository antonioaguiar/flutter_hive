import 'package:hive/hive.dart';

//nome da classe que sera gerada pelo build_runner
part 'escolas_model.g.dart';

@HiveType(typeId: 0)
class EscolasModel {
  @HiveField(0) //indica ao hive a ordem dos campos
  final String id;
  @HiveField(1) //indica ao hive a ordem dos campos
  final String nome;
  @HiveField(2) //indica ao hive a ordem dos campos
  final String municipio;

  EscolasModel(this.id, this.nome, this.municipio);
}


// executar no terminal para gerar o arquivo escolas_model.g.dart
// flutter packages pub run build_runner build

