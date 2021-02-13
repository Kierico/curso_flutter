/* Refatore o código do formulário, extraia o Widget para o editor aplicando técnicas para torná-lo genérico.

Nesta extração, considere o uso de parâmetros nomeados e opcionais para entregar uma experiência de uso similar aos Widgets prontos do Flutter. Dessa forma, permita que quem utilizar esse Widget seja capaz de mandar de maneira opcional os atributos para:

  Controlador;
  Rótulo;
  Dica;
  Ícone.

Em seguida, utilize o novo Widget enviando os parâmetros esperados com base no campo.

  Lembre-se de tratar o ícone para devolver o Widget Icon apenas quando ele não for nulo e devolver null quando ele for. Você pode usar o operador ternário para isso.

Por fim, extraia o código dentro do 'onPressed' para uma função que indica a criação de uma transferência. Então teste o App e veja se apresenta o mesmo aspecto visual de antes. */

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
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: '0000',
              rotulo: 'Número da conta',
            ),
            Editor(
              dica: '0.00',
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(),
            )
          ],
        ));
  }

  void _criaTransferencia() {
    final int numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text);
    final double valor =
        double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

/* https://github.com/alura-cursos/flutter-fundamentos/commit/b6e092ceb8640879435727b742f73142b666e1b0#diff-e61eb31d013d12616f5532636a88cfa63631dda8f7829e5424e68542214d1608L30 */