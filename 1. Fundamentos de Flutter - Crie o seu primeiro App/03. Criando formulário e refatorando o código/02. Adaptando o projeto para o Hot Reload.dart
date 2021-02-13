/* Extraia o restante do código que faz parte do Widget 'ListaTransferencias', como é o caso do 'Scaffold', 'AppBar' e 'FloatingActionButton'.

Em seguida, extraia o Widget 'MaterialApp' para a classe 'BytebankApp', com esse ajuste, podemos usar o ¹"Hot Reload do Flutter".
¹ https://flutter.dev/docs/development/tools/hot-reload

Após aplicar esses ajustes, crie o novo Widget 'FormularioTransferencia' e implemente a seguinte estrutura:

    .
    └── Scaffold
        ├── appBar - AppBar
        └── body - Text

Altere o valor do 'home' do 'MaterialApp' para uma instância de 'FormularioTransferencia'. Teste o Hot Reload aplicando algumas modificações na tela do formulário.

No IntelliJ você pode usar o Hot Reload clicando no ícone que representa um 'raio' ou com o atalho Ctrl + \.


O conteúdo do 'body' do 'Scaffold' do formulário não precisa ser o mesmo, fique à vontade para colocar o conteúdo que deseja, apenas certifique-se que o Hot Reload esteja funcionando. */

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
        body: Text('teste'));
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

/* https://github.com/alura-cursos/flutter-fundamentos/commit/df8947e5f0560d761b9caf17ec07c204cc6e6074 */