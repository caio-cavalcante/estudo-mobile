import 'dart:io';

List<int> sumLists(List<int> list1, List<int> list2) {
  List<int> list3 = [];

  for (int i = 0; i < list1.length; i++) {
    if (list1.length > list2.length) {
      list2.add(0);
    } else if (list1.length < list2.length) {
      list1.add(0);
    }
    
    list3.add(list1[i] + list2[i]);
  }

  return list3;
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

    List<int> list3 = sumLists(list1, list2);
    print(list3);

    stdout.write("Deseja continuar? (S/N) ");
    String continuar = stdin.readLineSync()!.toUpperCase();
    
    if (continuar != "S") {
      break;
    }
  }
}