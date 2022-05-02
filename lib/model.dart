
enum Sexo {MASCULINO, FEMININO}

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  int? getIdade(){

    if(nascimento == null){
      return null;
    }

    final dataAtual = DateTime.now();
    final idade = dataAtual.difference(nascimento!);

    return idade.inDays ~/ 365;
  }

  @override
  String toString() {
    return "{Nome: '$nome'. CPF: '$cpf'. Nascimento: '$nascimento'. Idade: '${getIdade()}'. Sexo: '$sexo'}";
  }
}

class Programador extends Pessoa{
  double? salario;

  @override
  String toString() {
    return "{Nome: '$nome'. CPF: '$cpf'. Nascimento: '$nascimento'. Idade: '${getIdade()}'. Sexo: '$sexo'. Salário: '$salario'.}";
  }

}

void mainEntidades(){
  Pessoa pessoa = Pessoa();

  pessoa.nome = "Maria Clara Franca";
  pessoa.cpf = "127.512.529-80";
  pessoa.nascimento = DateTime(2002, 7, 1);
  pessoa.sexo = Sexo.FEMININO;

  Programador prog = Programador();

  prog.nome = "Ana Rita Franca";
  prog.cpf = "123.456.789-10";
  prog.nascimento = DateTime(2005, 6, 17);
  prog.sexo = Sexo.FEMININO;
  prog.salario = 10000.00;

  print(pessoa.toString());
  print(prog.toString());
}