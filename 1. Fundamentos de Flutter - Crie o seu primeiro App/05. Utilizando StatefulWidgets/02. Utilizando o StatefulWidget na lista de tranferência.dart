/* Modifique a 'ListaTransferencia' para que implemente o 'StatefulWidget'. Ao modificar de 'StatelessWidget' para 'StatefulWidget' é necessário sobrescrever o método 'createState()' que devolve uma instância de 'StatefulWidget'.

Para essa instância é necessário criar um State, faça isso criando a classe 'ListaTransferenciaState' e estenda de 'State<ListaTransferencia>', então envie todo o código da função 'build()' da 'ListaTransferencia' para a 'ListaTransferenciaState'.

Com esse ajuste o código deixa de compilar por não ter acesso a lista de transferências da 'ListaTransferencia', para isso, utilize o objeto 'widget' que mantém a referência de 'StatefulWidget' da extensão de 'State' que nesse caso é 'ListaTransferencia'.

Com o código do 'ListaTransferenciaState' compilando, devolva uma instância de 'ListaTransferenciaState' no 'createState()' da 'ListaTransferencia'.

Faça o teste e veja se a integração entre a lista de transferências e formulário funcionam como esperado. */

  OPINIÃO DO INSTRUTOR:

import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
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
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text);
    final double valor =
        double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
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

class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
        final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
        }));
        future.then((transferenciaRecebida) {
          debugPrint('chegou no then do future');
          debugPrint('$transferenciaRecebida');
          widget._transferencias.add(transferenciaRecebida);
          setState( () {}); // add correção na aula.
        });
      },
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

/* https://github.com/alura-cursos/flutter-fundamentos/commit/38a68715db191278f024f7aa01933a39cf3d438b */