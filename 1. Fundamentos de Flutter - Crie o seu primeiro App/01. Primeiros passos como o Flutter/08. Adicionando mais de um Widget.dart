/* Modifique o código para permitir a adição de mais Widgets 'Text', para isso, faça com que o Widget raiz ('root') seja um Widget capaz de receber outros Widgets. Durante o vídeo consideramos o uso do ¹'Column', porém, existe outros Widgets possíveis, ²"você pode conferir por meio do catálogo".
¹ https://api.flutter.dev/flutter/widgets/Column-class.html
² https://flutter.dev/docs/development/ui/widgets

Para testar, você pode copiar o código contido na página do 'Column', segue a amostra apresentada no curso:

    Column(
    children: <Widget>[
        Text('Deliver features faster'),
        Text('Craft beautiful UIs'),
        Expanded(
        child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: const FlutterLogo(),
        ),
        ),
    ],
    )

Modifique o código para que a árvore de Widgets fique da seguinte maneira:

    .
    └── Column
        ├── Text
        ├── Text
        ├── Text
        └── Column
            └── Text

    Observe que o Widget Expanded não é utilizado.

Não precisa se preocupar com o conteúdo do 'Text', o objetivo do exercício é praticar a modificação do layout por meio da árvore de Widget. Após ajustar, teste o App e veja se apresenta o conteúdo esperado.

    Caso tiver dúvida sobre como está a estrutura da árvore, considere o uso da aba 'Flutter Outline' do IntelliJ que apresenta a árvore de Widgets atual. */


    OPNIÃO DO INSTRUTOR:

import 'package:flutter/material.dart';

void main() => runApp(Text('Bem vindo ao Bytebank', textDirection: TextDirection.ltr,)); 
void main() => runApp(
      Column(
        children: <Widget>[
          Text(
            'Deliver features faster',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Craft beautiful UIs',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Craft beautiful UIs',
            textDirection: TextDirection.ltr,
          ),
          Column(
            children: <Widget>[
              Text(
                'Craft beautiful UIs',
                textDirection: TextDirection.ltr,
              ),
            ],
          )
        ],
      ),
    );