import 'dart:io';
import 'dart:async';

void counter(int number) {
  if (number < 0) print("Tempo inválido.");

  Timer.periodic(const Duration(seconds: 1), (timer) {
    print(number);
    if (number == 0) {
      timer.cancel();
    }
    number--;
  });
}

void main() {
  stdout.write("\nDigite o tempo: ");
  int num = int.parse(stdin.readLineSync()!);

  counter(num);
}