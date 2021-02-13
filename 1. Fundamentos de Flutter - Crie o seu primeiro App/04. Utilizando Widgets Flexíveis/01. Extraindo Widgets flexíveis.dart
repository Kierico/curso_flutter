//import 'package:flutter/foundation.dart';
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
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Número da Conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            /* Alt + Enter : Convert to expression body = 'onPressed: () => _criaTransferencia(),'*/
            onPressed: () {
              _criaTransferencia();
            },
          ),
        ],
      ),
    );
  }

  void _criaTransferencia() {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(numeroConta, valor);
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
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          /*Na propriedade icon do nosso InputDecoration(),
          usaremos um operador ternário para verificarmos
          se o icone enviado por parâmetro é diferente "!=" de null.
          Em caso positivo, vamos carregá-lo com Icon(icone);
          já em caso negativo ":", simplesmente mandaremos uma referência nula.*/
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

  @override
  String toString() {
    return 'Transferencia{numeroConta: $numeroConta, valor: $valor}';
  }
}

/*No Flutter, os widgets, como o TextField(),
possuem diversas propriedades nomeadas,
e não somos obrigados a enviá-las para que eles funcionem da maneira esperada -
ou seja, essas propriedades são opcionais.*/

/*quando queremos implementar um widget com uma solução mais flexível,
precisamos adaptá-lo de tal forma. O Dart nos disponibiliza uma ferramenta
que nos ajudará nesse processo, que são os parâmetros opcionais.
Para utilizá-los, primeiramente teremos que passar todos os parâmetros do
nosso construtor dentro de um escopo de chaves "{}".*/

/*Além disso, os atributos da nossa classe não podem ser privados "_".
Essa alteração pode ser feita utilizando o recurso Rename do IntelliJ,
acessado pelo atalho "Shift + F6". Isso fará com que uma alteração feita em
um campo seja refletida em todos os pontos em que ele aparece. Alteraremos,
então, as variáveis _controlador, _rotulo, _dica e _icone para controlador,
rotulo, dica e icone.*/

/*Agora que os parâmetros são nomeados, precisaremos passá-los por extenso na
chamada do widget Editor(), começando por controlador: _controladorCampoNumeroConta.
Em seguida, podemos passar, por exemplo, dica: '0000'.
Isso porque uma das vantagens dos parâmetros nomeados é que não precisamos
seguir uma ordem estrita (ainda que a recomendação seja manter a ordem de modo
 a termos um código uniforme). Além disso, os parâmetros se tornam opcionais,
 eliminando a necessidade de passarmos uma referência nula.*/
