# TESTE HIVE

Este é um projeto Flutter que usa o Hive para armazenamento local de dados. 
O Hive é um banco de dados NoSQL rápido e leve que é fácil de usar e altamente eficiente.

## Dependências
Este projeto usa as seguintes dependências:

* Flutter
*  Hive
* Hive Flutter
* Hive Generator
* Build Runner

## Configuração
Para configurar o projeto, siga estas etapas:

* Clone o repositório.
* Execute *flutter pub get* para instalar as dependências.
* Execute *flutter packages pub run build_runner build* para gerar os adaptadores Hive necessários.


## Uso do Build Runner
Este projeto usa o Build Runner para gerar os adaptadores Hive. Os adaptadores Hive são classes que permitem que o Hive leia e escreva objetos personalizados.

Para gerar os adaptadores Hive, execute o seguinte comando:
```
flutter packages pub run build_runner build
```

Este comando deve ser executado sempre que você fizer uma alteração em uma classe que tem a anotação @HiveType.

## Execução
Para executar o projeto, use o seguinte comando:
```
flutter run
```

 