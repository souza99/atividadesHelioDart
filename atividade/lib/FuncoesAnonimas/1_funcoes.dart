// Quando vamos desenvolver uma aplicação, precisamos de funcionalizades que seja independentes de uma tecnologia
// nisso temos as funções que são um conjunto de instruções independentes de tecnologia;

import 'dart:ffi';
import 'dart:io';

// Feitas pelo professor
void show() {
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
  print(verificarAprovacao(escolha, n1, n2));
}

String verificarAprovacao(int escolha, double nota1, double nota2) {
  if (escolha == 1) {
    return aprovacaoMedia(nota1, nota2);
  } else if (escolha == 2) {
    return aprovacaoMaiorNota(nota1, nota2);
  } else {
    return aprovacaoMenorNota(nota1, nota2);
  }
}

String aprovacaoMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  if (media >= 6) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

String aprovacaoMaiorNota(double nota1, double nota2) {
  double maior = nota1;
  if (nota2 > nota1) {
    maior = nota2;
  }
  if (maior >= 6) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

String aprovacaoMenorNota(double nota1, double nota2) {
  double menor = nota1;
  if (nota2 < nota1) {
    menor = nota2;
  }
  if (menor >= 6) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

// Exemplo meu fazendo

show2() {
  print('''
Escolha uma opção:
(1) - Adicionar valor ao salario;
(2) - Descontar valor ao salarioa;
(3) - Bonificar o salario;
''');
  int escolha = int.parse(stdin.readLineSync()!);

  print('Informa o valor do salario');
  double salario = double.parse(stdin.readLineSync()!);

  print('Informe o valor para alterarmos o salario');
  double alteracao = double.parse(stdin.readLineSync()!);
  print(verificaEscolhaFuncao(escolha, salario, alteracao));
}

// Verifica qual foi a escolhar e chama a função;
double verificaEscolhaFuncao(int escolha, double salario, double alteracao) {
  if (escolha == 1) {
    return adicionarSalario(salario, alteracao);
  } else if (escolha == 2) {
    return descontarSalario(salario, alteracao);
  } else {
    return bonificarSalario(salario, alteracao);
  }
}

double adicionarSalario(double salario, double alteracao) {
  double calculo = salario + (salario * (alteracao / 100));
  return calculo;
}

double descontarSalario(double salario, double alteracao) {
  double calculo = salario - (alteracao * (alteracao / 100));
  return calculo;
}

double bonificarSalario(double salario, double alteracao) {
  double calculo = salario + (salario * ((alteracao / 100) - 0.1));
  return calculo;
}

// Exemplo meu, meu projeto

int? maximoVida;

show3() {
  print('''
Escolha uma opção:
(1) - Restaurar vida;
(2) - Receber dano;
(3) - Bonus de vida;
''');
  int escolha = int.parse(stdin.readLineSync()!);

  print('Informa valor da vida');
  int vida = int.parse(stdin.readLineSync()!);

  print('Informe o valor para alterarmos a vida');
  int varianteVida = int.parse(stdin.readLineSync()!);
  print(verificaEscolhaFuncaoVida(escolha, vida, varianteVida));
}

int verificaEscolhaFuncaoVida(int escolha, int vida, int varianteVida) {
  if (escolha == 1) {
    return restaurarVida(vida, varianteVida);
  } else if (escolha == 2) {
    return tirarVida(vida, varianteVida);
  } else {
    return bonificarViada(vida, varianteVida);
  }
}

int restaurarVida(int vida, int varianteVida) {
  int calculo = vida + varianteVida;
  return calculo;
}

int tirarVida(int vida, int varianteVida) {
  int calculo = vida - varianteVida;
  return calculo;
}

int bonificarViada(int vida, int varianteVida) {
  int calculo = vida + varianteVida;
  maximoVida = calculo;
  return calculo;
}
