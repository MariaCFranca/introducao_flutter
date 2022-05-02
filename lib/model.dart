
enum Sexo {MASCULINO, FEMININO}

Sexo? strToSexo(String? str) {
  if(str == null){
    return null;
  }

  switch(str){
    case 'MASCULINO':
    case 'M':
      return Sexo.MASCULINO;
    case 'FEMININO':
    case 'F':
      return Sexo.FEMININO;
    default:
      return null;
  }
}

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa(this.nome, this.cpf, this.nascimento, this.sexo);

  Pessoa.fromMap(Map<String, String> map){
    nome = map['nome'];
    cpf = map['cpf'];
    nascimento = DateTime.tryParse(map['nascimento'] ?? "2000-01-01");
    sexo = strToSexo(map['sexo']);
  }

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

  Programador(String? nome, String? cpf, DateTime? nascimento, Sexo? sexo, this.salario)
      : super(nome, cpf, nascimento, sexo);

  Programador.fromMap(Map<String, String> map) : super.fromMap(map){
    salario = double.tryParse(map['salario'] ?? "0.0");
  }

  @override
  String toString() {
    return "{Nome: '$nome'. CPF: '$cpf'. Nascimento: '$nascimento'. Idade: '${getIdade()}'. Sexo: '$sexo'. Salário: '$salario'.}";
  }

}

void mainEntidades(){

  final map = {
    'nome': 'Maria',
    'nascimento': '2002-07-01',
    'sexo': 'F',
    'salario': '10000.0'
  };

  Pessoa pessoa = Programador.fromMap(map);

  // pessoa.nome = "Maria Clara Franca";
  // pessoa.cpf = "127.512.529-80";
  // pessoa.nascimento = DateTime(2002, 7, 1);
  // pessoa.sexo = Sexo.FEMININO;

  // Programador prog = Programador();

  // prog.nome = "Ana Rita Franca";
  // prog.cpf = "123.456.789-10";
  // prog.nascimento = DateTime(2005, 6, 17);
  // prog.sexo = Sexo.FEMININO;
  // prog.salario = 10000.00;

  print(pessoa.toString());
  // print(prog.toString());
}