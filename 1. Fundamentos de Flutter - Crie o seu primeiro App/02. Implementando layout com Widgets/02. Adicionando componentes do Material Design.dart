/* Modifique o código para utilizar os componentes do Material Design do Flutter. Para isso, considere a seguinte estrutura:

    .
    └── MaterialApp
        └── Scaffold
            ├── AppBar
            │   └── title - Text
            └── FloatingActionButton
                └── child - Icon

    Caso tenha dúvidas sobre o Widget, ¹"fique à vontade para consultar o catálogo de widgets do Flutter para os componentes do Material Desing".
¹ https://flutter.dev/docs/development/ui/widgets/material

Realize os ajustes necessários e teste o código conferindo se apresenta o resultado esperado.

    Fique à vontade para usar a ²"proposta de implementação do App como apoio para o exercício".
² https://github.com/alura-cursos/flutter-fundamentos/blob/resources/proposta.pdf */


    OPINIÃO DO INSTRUTOR:

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('Transferências'),),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
  ),
));

/* https://github.com/alura-cursos/flutter-fundamentos/commit/501317683e4cf912890c738b4b773d8c704963f1 */