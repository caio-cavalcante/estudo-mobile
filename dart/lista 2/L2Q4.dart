Map<String, dynamic> map = {
  "Chave1": "Valor1",
  "Chave2": "Valor2",
  "Chave3": "Valor3"
};

void printMap(Map<String, dynamic> map) {
  for (var item in map.entries) {
    print("${item.key}: ${item.value}");
  }
}

void main() {
  printMap(map);
}