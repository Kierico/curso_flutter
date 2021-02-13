/* Atividades:
1° Introdução;
2° Introdução ao Flutter;
5° Abrindo o projeto no IntelluJ;
7° Entendendo o uso de Widgets. */

import 'package:flutter/material.dart';

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
          Column(children: <Widget>[
            Text(
              'Craft beautiful UIs',
              textDirection: TextDirection.ltr,
            ),
          ])
        ],
      ), //Column
    );
