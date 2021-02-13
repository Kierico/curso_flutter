/* Atividades:
1° Conhecendo o hot reload;
3° Montando o layout do formulário;
5° Criando a trasnferência;
7° Para saber mais - Apresentando mensagens com SnackBar. */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(KiericoBankApp());

class KiericoBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

//stless
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            // *"envolve tudo o TextField".
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(fontSize: 24.0 // *"double".
                  ),
              decoration: InputDecoration(
                labelText: 'Número da Conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            // *"envolve tudo o TextField".
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // *"controller: TextEditingController()"
              controller: _controladorCampoValor,
              style: TextStyle(fontSize: 24.0 // *"double".
                  ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            // *"Botao Confirmar"
            child: Text('Confirmar'),
            onPressed: () {
              // *"Para a impressão considere o debugPrint() como boa prática."
              debugPrint('clicou no confirmar');

              //debugPrint(_controladorCampoNumeroConta.text);
              //debugPrint(_controladorCampoValor.text);

              // *"Considere o uso do tryParse() para realizar a conversão."
              final int numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(numeroConta, valor);
                debugPrint('$transferenciaCriada');
                // *"mais o toString() la na class Transfencia, por causa do 'Instance of 'Transferencia', '."

                /*Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferenciaCriada'),
                  ),
                );*/
              }
            },
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(1984, 1.000)),
          ItemTransferencia(Transferencia(1988, 2.000)),
          ItemTransferencia(Transferencia(2015, 3.000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.numeroConta.toString()),
        subtitle: Text(_transferencia.valor.toString()),
      ),
    );
  }
}

class Transferencia {
  final int numeroConta;
  final double valor;

  Transferencia(this.numeroConta, this.valor);

  // *"Para verificar os valores da transferência, sobrescreva o toString() devolvendo os atributos da classe dentro da String."

  // *" Alt + Insert: para add toString(), por causa da 'Instance of 'Transferencia', '."
  @override
  String toString() {
    return 'Transferencia{numeroConta: $numeroConta, valor: $valor}';
  }
}
