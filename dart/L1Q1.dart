import 'dart:io';

void printDate(int dia, int mes, int ano) {
  if (dia < 1 || dia > 31 || mes < 1 || mes > 12) {
    print("Data inválida.");
  } else {
    print("$dia/$mes/$ano");
  }
}

void main() {
  while (true) {
    stdout.write("Digite o dia: ");
    int dia = int.parse(stdin.readLineSync()!);

    stdout.write("Digite o mês: ");
    int mes = int.parse(stdin.readLineSync()!);

    stdout.write("Digite o ano: ");
    int ano = int.parse(stdin.readLineSync()!);

    printDate(dia, mes, ano);

    stdout.write("Deseja continuar? (S/N) ");
    String continuar = stdin.readLineSync()!.toUpperCase();
    
    if (continuar != "S") {
      break;
    }
  }
}