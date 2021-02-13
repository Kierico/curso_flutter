/* Integre a lista de transferência com o formulário de transferência. Para isso, modifique a propriedade 'home' do 'MaterialApp' para que abra a lista de transferência.

Em seguida, implemente o 'onPressed' do 'FloatingActionButton' para quando ele for clicado aconteça a navegação para a tela de formulário de transferência.

Para a navegação, utilize a função 'push()' do 'Navigator' enviando como argumento um 'BuildContext' e o 'Route<T>'. Para o 'Route<T>' considere o 'MaterialPageRoute' que é uma implementação do Material Components com o objetivo de facilitar o uso e aplicar algumas propriedades comum no Material Design, como é o caso da transição com animação.

Para o 'MaterialPageRoute' envie o argumento 'builder' que espera um callback que recebe um 'BuildContext' e devolve um Widget. Então, dentro do lambda, retorne o Widget do formulário.

Então, atribua o retorno do 'push()' para a variável do tipo 'Future<Transferencia>'. Com acesso ao future, utilize a função 'then()' que espera um callback que recebe a transferência criada via parâmetro. No escopo da expressão lambda imprima a transferência recebida para testar o comportamento de criação.

No formulário, no momento que a transferência é criada, utilize a função 'pop()' do 'Navigator' enviando o 'BuildContext' e a transferência criada via argumento respectivamente.

Por fim, teste o App e veja se a transferência criada é recebida na lista de transferências. */

  OPINIÃO DO INSTRUTOR:

import 'package:flutter/material.dart';
void main() => runApp(BytebankApp());
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
        body: ListaTransferencias(),
      ),
    );
  }
@@ -39,20 +39,22 @@ class FormularioTransferencia extends StatelessWidget {
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ));
  }

  void _criaTransferencia() {
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
@@ -98,7 +100,15 @@ class ListaTransferencias extends StatelessWidget {
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        child: Icon(Icons.add), onPressed: () {
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
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

/* https://github.com/alura-cursos/flutter-fundamentos/commit/c541c1dce7959985c5bb0b68bb163b58b1b27247 */