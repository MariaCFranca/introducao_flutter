
enum Sexo {MASCULINO, FEMININO}

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;
  double? salario;
  bool? programador;

  @override
  String toString() {
    return "{Nome: '$nome'. CPF: '$cpf'. Nascimento: '$nascimento'. Idade: '$idade'. Sexo: '$sexo'. Salário: '$salario'. Programador: '$programador'.}";
  }
}

void mainEntidades(){
  Pessoa pessoa = Pessoa();

  pessoa.nome = "Maria Clara Franca";
  pessoa.cpf = "127.512.529-80";
  pessoa.nascimento = DateTime(2002, 7, 1);
  pessoa.idade = 19;
  pessoa.sexo = Sexo.FEMININO;
  pessoa.salario = 10000.00;
  pessoa.programador = true;

  Pessoa pessoa2 = Pessoa();

  pessoa2.nome = "Ana Rita Franca";
  pessoa2.cpf = "123.456.789-10";
  pessoa2.nascimento = DateTime(2005, 6, 17);
  pessoa2.idade = 16;
  pessoa2.sexo = Sexo.FEMININO;
  pessoa2.salario = 6000.00;
  pessoa2.programador = false;

  print(pessoa);
  print(pessoa2);
}