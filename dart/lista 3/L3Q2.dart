/*
Questão 2)  Escreva   uma   classe   em   que   cada   objeto   representa   um   voo   que   acontece   em determinada data e em determinado horário. Cada voo possui no máximo 100 passageiros, e a classe permite controlar a ocupação das vagas. A classe deve ter os seguintes construtores e métodos:
•Construtor gerativo que configura os dados do voo (número do voo e data) recebidos por parâmetros nomeados. Para armazenar a data utilize um objeto da classe DateTime.
•proximoLivre: retorna o número da próxima cadeira livre.
•verifica: verifica se o número da cadeira recebido como parâmetro está ocupada.
•ocupa: marca determinada cadeira do voo como ocupada. O número da cadeira é recebido como parâmetro. Retorna verdadeiro se a cadeira estava livre e pôde ser ocupada (operação foi bem sucedida) e falso caso contrário.
•vagas: retorna o número de cadeiras disponíveis (não ocupadas) no voo.
•isCheio: retorna verdadeiro se o avião já estiver cheio.
 */
class Voo {
  int numVoo;
  DateTime dataVoo;
  List<bool> passageiros = List<bool>.filled(100, false);

  Voo({required this.numVoo, required this.dataVoo});

  int proximoLivre () {
    for (int i = 0; i < passageiros.length; i++) {
      if (!passageiros[i]) {
        return i + 1;
      }
    }
    return 0;
  }

  bool verifica (int cadeira) {
    _validarCadeira(cadeira);

    return !passageiros[cadeira - 1];
  }

  bool ocupa (int cadeira) {
    _validarCadeira(cadeira);

    int indice = cadeira - 1;
    if (!passageiros[indice]) return passageiros[indice] = true;

    return false;
  }

  int vagas () {
    return passageiros.where((passageiros) => !passageiros).length;
  }

  bool isCheio () {
    return vagas() == 0;
  }

  void _validarCadeira(int cadeira) {
    if (cadeira < 1 || cadeira > 100) {
      throw RangeError('O número da cadeira deve estar entre 1 e 100.');
    }
  }
}

void main () {
  Voo meuVoo = Voo(
    numVoo: 123,
    dataVoo: DateTime.now()
  );

  print('Voo número: ${meuVoo.numVoo} em ${meuVoo.dataVoo}');
  print('Vagas iniciais: ${meuVoo.vagas()}'); // Deve exibir 100
  print('Próxima cadeira livre: ${meuVoo.proximoLivre()}'); // Deve exibir 1

  // Ocupando algumas cadeiras
  print('\nTentando ocupar a cadeira 5: ${meuVoo.ocupa(5)}'); // true
  print('Tentando ocupar a cadeira 5 novamente: ${meuVoo.ocupa(5)}'); // false
  
  print('\nA cadeira 5 está ocupada? ${meuVoo.verifica(5)}'); // true
  print('A cadeira 6 está ocupada? ${meuVoo.verifica(6)}'); // false

  print('\nPróxima cadeira livre agora: ${meuVoo.proximoLivre()}'); // Deve exibir 1
  meuVoo.ocupa(1);
  print('Próxima cadeira livre após ocupar a 1: ${meuVoo.proximoLivre()}'); // Deve exibir 2

  print('\nTotal de vagas restantes: ${meuVoo.vagas()}'); // Deve exibir 98
  print('O avião está cheio? ${meuVoo.isCheio()}'); // false
}