import 'dart:io';

String ageRange(int age) => 
  age < 0 ? "Idade inválida" :
  age < 12 ? "Criança" : 
  age < 18 ? "Adolescente" : 
  age < 50 ? "Adulto" : 
  age < 65 ? "Corôa" : 
  "Idoso";

void main() {
  while (true) {
    stdout.write("Digite a idade: ");
    int age = int.parse(stdin.readLineSync()!);

    print(ageRange(age));

    stdout.write("Deseja continuar? (S/N) ");
    String continuar = stdin.readLineSync()!.toUpperCase();
    
    print(''); // print always appends a new line, doesnt need \n
    if (continuar != "S") {
      break;
    }
  }
}