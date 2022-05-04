import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // StatefulWidget = Telas, possuem estado (duas classes sempre - StatefulWidget e State)
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // muda com o passar do tempo mas mantém a tela estática
  int _contador = 0;
  bool _incrementando = true;
  final List<int> _historico = [];
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu app Flutter'),
      ),
      drawer: _buildDrawer(),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarEdecrementar,
        tooltip: _incrementando ? 'Increment' : 'Decrement',
        child: Icon(_incrementando ? Icons.add : Icons.remove),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Contador:',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )),
          Text(
            '$_contador',
            style: Theme
                .of(context)
                .textTheme
                .headline4,
          ),
          const SizedBox(height: 20.0),
          const Text('Histórico:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                _historico.isEmpty ? '- -' : _historico.join(', '),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, color: Colors.grey.shade600),
              )),
          const SizedBox(height: 20.0),
          const Text('Total:',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              '$_total',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, color: Colors.grey.shade600),
            )
          )
        ],
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text(
              'NavBar test',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            // zerar, inverter, memorizar
            leading: const Icon(Icons.delete),
            title: const Text('Zerar'),
            onTap: _zerar,
          ),
          ListTile(
            leading: const Icon(Icons.autorenew),
            title: const Text('Inverter'),
            onTap: _inverter,
          ),
          ListTile(
              leading: const Icon(Icons.memory),
              title: const Text('Memorizar'),
              onTap: _memorizar,
          ),
        ]));
  }

  void _incrementarEdecrementar() {
    setState(() {
      // atualizar a tela
      if (_incrementando) {
        _contador++;
      } else {
        _contador--;
      }
    });
  }

  void _zerar() {
    Navigator.of(context).pop();
    setState(() {
      _contador = 0;
      _historico.clear();
      _total = 0;
    });
  }

  void _inverter() {
    Navigator.of(context).pop();
    setState(() {
      _incrementando = !_incrementando;
    });
  }

  void _memorizar() {
    Navigator.of(context).pop();
    setState(() {
      _historico.add(_contador);
      _total = _historico.isEmpty ? 0 : _historico.reduce((a, b) => a + b);
    });
  }

  void _somar(){
    Navigator.of(context).pop();
    setState(() {

    });
  }
}
