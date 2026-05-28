/**
 * 5. Escreva uma função que receba dois mapas via parâmetros e retorne um mapa com o 
conteúdo dos dois unidos.
 */
Map<String, dynamic> map1 = {
  "Chave1": "Valor1",
  "Chave2": "Valor2",
  "Chave3": "Valor3"
};

Map<String, dynamic> map2 = {
  "Chave4": "Valor4",
  "Chave5": "Valor5",
  "Chave6": "Valor6"
};

Map<String, dynamic> mergeMaps(Map<String, dynamic> map1, Map<String, dynamic> map2) {
  Map<String, dynamic> mergedMap = {...map1, ...map2};
  return mergedMap;
}

void printMap(Map<String, dynamic> map) {
  print("Mapa:");
  for (var item in map.entries) {
    print("${item.key}: ${item.value}");
  }
  print("");
}

void main() {
  printMap(map1);
  printMap(map2);
  Map<String, dynamic> map3 = mergeMaps(map1, map2);
  printMap(map3);
}