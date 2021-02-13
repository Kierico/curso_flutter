/* Configure o código do formulário para que ao clicar no botão confirmar, seja criada uma transferência com base no conteúdo dos 'TextFields'.

Para isso, crie um 'TextEditingController' como atributo da classe 'FormularioTransferencia' para cara 'TextField', então os envie para a propriedade 'controller' dos 'TextFields' correspondentes.

Em seguida, implemente a propriedade 'onPressed' do 'RaisedButton'. Dentro da lambda do 'onPressed' busque os valores de cada controlador e tente realizar a conversão para o número da conta com o tipo 'int' e para o valor com o tipo 'double'.

  Considere o uso do 'tryParse()' para realizar a conversão.

Então, verifique se nenhum dos valores são nulos, se for verdade, crie a transferência e a imprima para verificar se está funcionando.

  Para a impressão considere o 'debugPrint()' como boa prática.

Para verificar os valores da transferência, sobrescreva o 'toString()' devolvendo os atributos da classe dentro da 'String'.

Por fim, teste o App e veja se a transferência é criada quando ao clicar no botão confirmar com os campos do formulário preenchidos. */

  OPINIÃO DO INSTRUTOR:

/* Observe que o botão confirmar é habilitado ao implementar o 'onPressed', como resultado deste teste, temos o seguinte resultado no console:

  I/flutter ( 9614): Transferencia{valor: 123.0, numeroConta: 123} */

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
      appBar: AppBar(title: Text('Criando Transferência'),),
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 24.0
                ),
                controller: _controladorCampoNumeroConta,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0000'
                ),
                    labelText: 'Número da conta', hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 24.0
                ),
                controller: _controladorCampoValor,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'
                ),
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0.00'),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                debugPrint('clicou no confirmar');
                final int numeroConta =
                    int.tryParse(_controladorCampoNumeroConta.text);
                final double valor =
                    double.tryParse(_controladorCampoValor.text);
                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint('$transferenciaCriada');
                }
              },
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }


}

/* https://github.com/alura-cursos/flutter-fundamentos/commit/67b4e3338f9d8fb3e1d74530bbca0f4237ec00ab */