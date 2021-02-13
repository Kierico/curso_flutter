/*Implemente o layout do formulário de transferência que atenda os aspectos visuais apresentados pela proposta de implementação. Para isso, considere a seguinte árvore de Widgets:

.
└── Column
    ├── Padding
    │   └── TextField
    ├── Padding
    │   └── TextField
    └── RaisedButton
        └── Text

Durante o exercício, aproveite para testar o Hot Reload :)

Em seguida, estilize o TextField para que tenha um rótulo (label) e dica (dica) correspondente ao campo.

Faça com que cada campo utilize o teclado numérico e que o campo que representa o valor da transferência tenha um ícone indicando monetização. ência do TextField considere o uso da propriedade decoration que recebe um InputDecoration.

Para aplicar a margem, envolva o TextField em Padding e aplique o valor 16.0 em volta de todo o Widget.

Você pode usar o recurso do IntelliJ para adicionar Padding no Widget.

Lembre-se de ajustar o tamanho de fonte por meio da propriedade style que recebe o TextStyle.

Depois de finalizar os ajustes, confira se o layout atende ao layout da proposta. */

  OPINIÃO DO INSTRUTOR:

import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência'),),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 24.0
                ),
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0000'
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 24.0
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text('Confirmar'),
            )
          ],
        ));
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
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 2000)),
          ItemTransferencia(Transferencia(300.0, 3000)),
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
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

/* https://github.com/alura-cursos/flutter-fundamentos/commit/1012d022f3bd2861f2b5d233a64c9c07b9f55c7c */