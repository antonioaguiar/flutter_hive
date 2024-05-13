import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';
import 'package:testehive/controllers/app_controller.dart';
import 'package:testehive/providers/escolas_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final Connectivity _connectivity = Connectivity();
  //List<ConnectivityResult> connectivityResult = [];
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  // Initialize a variable with [none] status to avoid nulls at startup
  //List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];

  late EscolasProviders escolasProvider;

  @override
  void initState() {
    super.initState();
    escolasProvider = Provider.of<EscolasProviders>(context, listen: false);

    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    context.read<AppController>().conectividade = result;
  }

// Make sure to cancel subscription after you are done
  @override
  dispose() {
    // subscription.cancel();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Hive Teste"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.watch<AppController>().getConectividade,
            ),
            Expanded(
              child: Consumer<EscolasProviders>(
                builder: (context, escolasProvider, child) {
                  return ListView.builder(
                    itemCount: escolasProvider.getEscolas().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(escolasProvider.getEscolas()[index].nome),
                        subtitle:
                            Text(escolasProvider.getEscolas()[index].municipio),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            escolasProvider.removeEscola(
                                escolasProvider.getEscolas()[index].id);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEscola,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void addEscola() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String id = '';
        String nome = '';
        String municipio = '';

        return AlertDialog(
          title: const Text('Add Escola'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  id = value;
                },
                decoration: const InputDecoration(labelText: 'ID'),
              ),
              TextField(
                onChanged: (value) {
                  nome = value;
                },
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                onChanged: (value) {
                  municipio = value;
                },
                decoration: const InputDecoration(labelText: 'Município'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                escolasProvider.addEscola(id, nome, municipio);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
