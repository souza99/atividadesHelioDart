import 'dart:io';

void main(List<String> arguments) {
  print('''
    Escolha uma opção: 
    (1) - verificar aprovação pela média;
    (2) - verificar aprovação pela maior nota; e
    (3) - verificar aprovação pela menor nota.
  ''');
  int escolha = int.parse(stdin.readLineSync()!);
  print('Informe a 1º nota:');
  double n1 = double.parse(stdin.readLineSync()!);
  print('Informe a 2º nota:');
  double n2 = double.parse(stdin.readLineSync()!);
  bool aprovado;
  if (escolha == 1) {
    //definindo ação com função nomeada - uma ação que previamente era conhecido
    aprovado = verificarAprovacao(n1, n2, calcularMedia);
  } else if (escolha == 2) {
    //refazendo a função nomeada verificarMaiorNota em função anônima - somente para comparar e entender a sintaxe
    aprovado = verificarAprovacao(n1, n2, (double nota1, double nota2) {
      double maior = nota1;
      if (nota2 > nota1) maior = nota2;
      return maior;
    });
  } else {
    /*
    Definindo uma ação dinâmica - previamente desconhecido - verificar aprovação com peso
    aqui pode-se notar a vantagem de definir uma parâmetro do tipo função.
    Pois, na chamada de verificarAprovação, podemos definir uma ação que antes não era conhecido.
    Neste caso estamos verificando a aprovação com peso.
    Com a definição de um parâmetro de função, damos a liberdade de definir qualquer ação não prevista.
    */
    aprovado = verificarAprovacao(n1, n2, () {
      n1 = n1 * 2; // nota1 tem peso 2
      double media = (n1 + n2) / 3;
      return media;
    });
  }
  print(aprovado ? 'aprovado' : 'reprovado');
}

bool verificarAprovacao(double nota1, double nota2, Function caclularNota) {
  double nota = caclularNota(nota1, nota2);
  return (nota >= 6);
}

double calcularMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  return media;
}

double calcularMaiorNota(double nota1, double nota2) {
  double maior = nota1;
  if (nota2 > nota1) maior = nota2;
  return maior;
}

double calcularMenorNota(double nota1, double nota2) {
  double menor = nota1;
  if (nota2 < nota1) menor = nota2;
  return menor;
}
