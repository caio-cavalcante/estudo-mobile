import 'dart:io';

bool checkList(List<int> list1, List<int> list2) {
  for (int i = 0; i < list2.length; i++) {
    if (!list1.contains(list2[i])) {
      return false;
    }
  }

  return true;
}

void main() {
  while (true) {
    List<int> list1 = [];
    List<int> list2 = [];

    stdout.write("Digite o tamanho da primeira lista: ");
    int tam1 = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < tam1; i++) {
      stdout.write("Digite o elemento ${i + 1} da primeira lista: ");
      list1.add(int.parse(stdin.readLineSync()!));
    }

    stdout.write("Digite o tamanho da segunda lista: ");
    int tam2 = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < tam2; i++) {
      stdout.write("Digite o elemento ${i + 1} da segunda lista: ");
      list2.add(int.parse(stdin.readLineSync()!));
    }

    print(checkList(list1, list2));

    stdout.write("Deseja continuar? (S/N) ");
    String continuar = stdin.readLineSync()!.toUpperCase();
    
    if (continuar != "S") {
      break;
    }
  }
}