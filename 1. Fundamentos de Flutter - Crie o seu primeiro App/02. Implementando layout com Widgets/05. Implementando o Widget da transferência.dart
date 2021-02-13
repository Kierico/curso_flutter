/* Com a estrutura pronta dos componentes do Material Design, implemente o design que vai representar cada item da lista de transferências. Para isso considere a seguinte árvore para cada item:

.
└── Card
    └── ListTile
        ├── leading - Icon
        ├── title - Text
        └── subtitle - TextCOPIAR CÓDIGO
Em seguida, envolva o Card em um Column e adicione mais um card com a mesma estrutura e conteúdo diferente para simular uma lista com duas transferências.

Teste o código e veja se apresenta o resultado esperado com base na proposta de implementação. */

  OPINIÃO DO INSTRUTOR:
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('100.0'),
            subtitle: Text('1000'),
          )
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('200.0'),
            subtitle: Text('1000'),
          )
        ),
      ],
    ),
    appBar: AppBar(title: Text('Transferências'),),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
  ),
));