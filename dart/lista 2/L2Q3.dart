import 'dart:io';

List stringSearch (List<String> list, String string) {
  var filtered = list.where((item) => item.startsWith(string)).toList();
  
  return filtered;
}

void main() {
  while (true) {
    stdout.write("Diga o tamanho da lista: ");
    int tam = int.parse(stdin.readLineSync()!);
    
    List<String> list = [];

    for (int i = 0; i < tam; i++) {
      stdout.write("Digite o elemento ${i + 1}: ");
      list.add(stdin.readLineSync()!);
    }

    stdout.write("Digite a string: ");
    String string = stdin.readLineSync()!;

    print(stringSearch(list, string));

    stdout.write("Deseja continuar? (S/N) ");
    String continuar = stdin.readLineSync()!.toUpperCase();
    
    if (continuar != "S") {
      break;
    }
  }
}