/*
Questão 2)  Escreva   uma   classe   em   que   cada   objeto   representa   um   voo   que   acontece   em determinada data e em determinado horário. Cada voo possui no máximo 100 passageiros, e a classe permite controlar a ocupação das vagas. A classe deve ter os seguintes construtores e métodos:
•Construtor gerativo que configura os dados do voo (número do voo e data) recebidos por parâmetros nomeados. Para armazenar a data utilize um objeto da classe DateTime.
•proximoLivre: retorna o número da próxima cadeira livre.
•verifica: verifica se o número da cadeira recebido como parâmetro está ocupada.
•ocupa: marca determinada cadeira do voo como ocupada. O número da cadeira é recebido como parâmetro. Retorna verdadeiro se a cadeira estava livre e pôde ser ocupada (operação foi bem sucedida) e falso caso contrário.
•vagas: retorna o número de cadeiras disponíveis (não ocupadas) no voo.
•isCheio: retorna verdadeiro se o avião já estiver cheio.
 */
import 'dart:io';

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

void menu (Voo vooMenu) {
  int opcao, cadeira;

  do {
    print("MENU");
    print("1 - Proximo livre");
    print("2 - Verifica cadeira"); 
    print("3 - Ocupa cadeira");
    print("4 - Vagas");
    print("5 - Cheio");
    print("6 - Sair");

    stdout.write("Escolha uma opção: ");
    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        print("A próxima cadeira livre é a ${vooMenu.proximoLivre()}\n");
      case 2:
        stdout.write("Digite o número da cadeira: ");
        cadeira = int.parse(stdin.readLineSync()!);

        if (vooMenu.verifica(cadeira)) {
          print("Cadeira livre.\n");
        } else {
          print("Cadeira ocupada.\n");
        }
      case 3:
        stdout.write("Digite o número da cadeira: ");
        cadeira = int.parse(stdin.readLineSync()!);

        if (vooMenu.ocupa(cadeira)) {
          print("Cadeira ocupada.\n");
        } else {
          print("A cadeira ja estava ocupada.\n");
        }
      case 4:
        print("Vagas: ${vooMenu.vagas()}\n");
      case 5:
        if (vooMenu.isCheio()) {
          print("O voo está cheio.\n");
        } else {
          print("O voo não está cheio.\n");
        }
      case 6:
        break;
      default:
        print("Opção inválida.\n");
    }
  } while (opcao != 6);
}

void main () {
  Voo meuVoo = Voo(numVoo: 1, dataVoo: DateTime.now());
  print("Voo criado! Número: ${meuVoo.numVoo}. Data: ${meuVoo.dataVoo}\n");

  menu(meuVoo);
}