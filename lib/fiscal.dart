import 'dart:collection';

import 'package:flutter/material.dart';

enum Sexo { MASCULINO, FEMININO }

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa({this.nome, this.cpf, this.nascimento, this.sexo});
}

class NotaFiscal {
  int? numero;
  DateTime? emissao;
  Pessoa? cliente = Pessoa();
  String? enderecoEntrega;
  List<ItemNF> listaItens = [];

  NotaFiscal({this.numero, this.emissao, this.cliente, this.enderecoEntrega});

  double total = 0.0;

  ItemNF addItem(
      {required double valor,
      required String produto,
      double desconto = 0.0,
      double acrescimo = 0.0}) {

    // if (valor == 0.0) {
    //   throw Exception('Valor não pode ser zero.');
    // }
    //
    // if (produto == '') {
    //   throw Exception('Produto precisa ser informado');
    // }

    ItemNF item = ItemNF(
        numSeq: listaItens.length + 1,
        produto: produto,
        valor: valor,
        desconto: desconto,
        acrescimo: acrescimo);
    listaItens.add(item);
    return item;
  }

  double calcularValorTotal() {

    Iterable<double> valores = listaItens.map((item) => item.getValorTotal());

    return valores.reduce((a, b) => a + b);

    // for (int i = 0; i < listaItens.length; i++) {
    //   total += listaItens[i].getValorTotal();
    // }
    // return total;
  }

  ItemNF? getProdutoMaisBarato() {
    return listaItens.reduce((a, b) => a.getValorTotal() < b.getValorTotal() ? a : b);

    // ItemNF? itemBarato;
    // for (ItemNF item in listaItens) {
    //   if (itemBarato == null) {
    //     itemBarato = item;
    //   } else if (item.getValorTotal() < itemBarato.getValorTotal()) {
    //     itemBarato = item;
    //   }
    // }
    // return itemBarato;
  }

  ItemNF? getProdutoMaisCaro() {
    return listaItens.reduce((a, b) => a.getValorTotal() > b.getValorTotal() ? a : b);

    // ItemNF? itemCaro;
    //
    // for (ItemNF item in listaItens) {
    //   if (itemCaro == null) {
    //     itemCaro = item;
    //   } else if (item.getValorTotal() > itemCaro.getValorTotal()) {
    //     itemCaro = item;
    //   }
    // }
    // return itemCaro;
  }

  bool possuiDesconto() {
    return listaItens.any((i) => i.desconto > 0);
  }

  List<ItemNF> ItensComDesconto(){
    return listaItens.where((i) => i.desconto > 0).toList();
  }

  String getStrItens(){
    return listaItens.map((i) => "${i.numSeq}: ${i.produto}").join(", ");
  }
}

class ItemNF {
  int numSeq;
  String produto;
  double valor = 0;
  double desconto = 0;
  double acrescimo = 0;

  ItemNF(
      {required this.numSeq,
      required this.produto,
      this.valor = 0.0,
      this.desconto = 0.0,
      this.acrescimo = 0.0});

  double getValorTotal() {
    return valor + acrescimo - desconto;
  }

  @override
  String toString() {
    return '{numSeq = $numSeq, produto=$produto, valor=$valor, desconto-$desconto, acrescimo=$acrescimo}';
  }
}

void mainNotaFiscal() {
  // try {
  //   final pessoa = Pessoa(nome: "Maria");
  //
  //   final nota = NotaFiscal(
  //       cliente: pessoa,
  //       emissao: DateTime(2022, 5, 3),
  //       enderecoEntrega: 'rua 7 de Setembro',
  //       numero: 1500);
  //
  //   nota.addItem(valor: 10000.00, produto: 'notebook');
  //   nota.addItem(valor: 200.00, produto: 'Teclado');
  //
  //   nota.calcularValorTotal().then((value){
  //     double valorTotal = value;
  //     print("valor total da NF = $valorTotal");
  //   });
  //
  //   print('Produto mais barato = ${nota.getProdutoMaisBarato()}');
  // } on Exception catch (e) {
  //   print(e.toString());
  // }

  //  SET -> Não repete valores/
  // Set<String> nomes = HashSet<String>(); // HashSet - ordem embaralhada
  // // Set<String> nomes = LinkedHashSet<String>(); // LinkedHashSet - ordem que foi cadastrado
  // // Set<String> nomes = Set<String>();
  //
  // nomes.add('João');
  // nomes.add('Maria');
  // nomes.add('João');
  //
  // print(nomes);

  Queue<String> fila = Queue<String>(); // Fila
  //final fila = <String>[]..add('Ana')..add('Maria')..add('Samuel');

  fila.add('Ana');
  fila.add("Samuel");
  fila.add("Joao");
  fila.add("Yuri");

  while(fila.isNotEmpty){
    print(fila.removeLast());
    print(fila);
  }
}
