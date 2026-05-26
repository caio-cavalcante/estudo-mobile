import 'dart:io';

void checkPhone(String phone) {
  print('input $phone');
  String numbersOnly = phone.replaceAll(RegExp(r'\D'), ''); 
  print('output $numbersOnly');
  if (numbersOnly.length == 11 || numbersOnly.length == 9) {
    print("válido");
  } else {
    print("inválido");
  } 
}

void main() {
  while (true) {
    stdout.write("\nDigite o telefone: ");
    String phone = stdin.readLineSync()!;

    checkPhone(phone.toString());

    stdout.write("Deseja continuar? (S/N) ");
    String continuar = stdin.readLineSync()!.toUpperCase();
    
    if (continuar != "S") {
      break;
    }
  }
}