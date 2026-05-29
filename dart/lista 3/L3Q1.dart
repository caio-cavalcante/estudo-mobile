/*
Questão 1) Escreva uma classe cujos objetos representam alunos matriculados em uma disciplina. 
Cada objeto dessa classe deve guardar os seguintes dados do aluno: matrícula, nome, duas notas de 
prova e uma nota de notaTrabalho. Escreva os seguintes construtores e métodos para esta classe:
•Construtor gerativo com matrícula e nome obrigatórios.
•Factory fromJson que recebe a matrícula e nome de um Map conforme o exemplo a seguir:
{
  "matricula": "123BSI456",
  "nome": "Fulano de Tal"
}
•Métodos:
◦media: retorna a média final do aluno (cada prova tem peso 2,5 e o trabalho tem peso 2).
 */
class Aluno {
  String matricula;
  String nome;
  double notaProva1;
  double notaProva2;
  double notaTrabalho;

  Aluno(this.matricula, this.nome)
    : notaProva1 = 0.0,
      notaProva2 = 0.0,
      notaTrabalho = 0.0;

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      json['matricula'] as String,
      json['nome'] as String,
    );
  }

  double media() {
    double pesoProvas = 2.5;
    double pesonotaTrabalho = 2.0;

    double somaNotas = (notaProva1 + notaProva2) * pesoProvas + notaTrabalho * pesonotaTrabalho;

    double somaPesos = (pesoProvas * 2) + pesonotaTrabalho;

    return somaNotas / somaPesos;
  }
}

void main() {
  var aluno1 = Aluno("123BSI456", "Fulano de Tal");
  aluno1.notaProva1 = 5.0;
  aluno1.notaProva2 = 8.0;
  aluno1.notaTrabalho = 8.0;

  print('Aluno 1: ${aluno1.nome}');
  print('Média: ${aluno1.media().toStringAsFixed(2)}\n');

  Map<String, dynamic> dadosJson = {
    "matricula": "789BSI011",
    "nome": "Ciclano de Tel"
  };

  var aluno2 = Aluno.fromJson(dadosJson);
  aluno2.notaProva1 = 6.0;
  aluno2.notaProva2 = 5.5;
  aluno2.notaTrabalho = 7.0;

  print('Aluno 2: ${aluno2.nome}');
  print('Média: ${aluno2.media().toStringAsFixed(2)}');
}