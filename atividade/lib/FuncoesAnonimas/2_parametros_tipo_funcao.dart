import 'dart:ffi';
import 'dart:io';

int maximoVida = 50;

// Função do professor
void show() {}

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
    aprovado = verificarAprovacao(n1, n2,
        calcularMedia); //definindo a ação "aprovacaoMedia" na chamada da função verificarAprovacao
  } else if (escolha == 2) {
    aprovado = verificarAprovacao(n1, n2,
        calcularMaiorNota); //definindo a ação "aprovacaoMaiorNota" na chamada da função verificarAprovacao
  } else {
    aprovado = verificarAprovacao(n1, n2,
        calcularMenorNota); //definindo a ação "aprovacaoMenorNota" na chamada da função verificarAprovacao
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

// Função atividade;

showAtividade() {
  print('''
Escolhar uma opção:
01-Adicionar valor ao salario;
02-Descontar valor ao salario;
03-Adicionar valor com encargo;
''');
  int escolha = int.parse(stdin.readLineSync()!);

  print("Informe o valor do salário");
  double salario = double.parse(stdin.readLineSync()!);

  print("Informe o valor de alteração ao salario em porcentagem");
  double variante = double.parse(stdin.readLineSync()!);

  String? resultado;
  if (escolha == 1) {
    resultado = verificarSalario(salario, variante, calculoPorcentagemAcrecimo);
  } else if (escolha == 2) {
    resultado = verificarSalario(salario, variante, calculoPorcentagemDesconto);
  } else if (escolha == 3) {
    resultado =
        verificarSalario(salario, variante, calculoAcrescimoComDesconto);
  }
  print(resultado);
}

String verificarSalario(double nota1, double nota2, Function caclularNota) {
  String nota = caclularNota(nota1, nota2);
  return nota;
}

String calculoPorcentagemAcrecimo(double valor1, double valor2) {
  double porcentagemMultiplicadoValor1 = valor1 * (valor2 / 100);
  double porcentagemMiltiplicavalorFinal =
      porcentagemMultiplicadoValor1 / (100);
  String valor = "O valor de acrecimo em porcentagem encima do salario é de: " +
      porcentagemMiltiplicavalorFinal.toString() +
      "%";
  return valor;
}

String calculoPorcentagemDesconto(double valor1, double valor2) {
  double porcentagemMultiplicaValor1 = valor1 * (valor2 / 100);
  double porcentagemMultiplicaFinal = porcentagemMultiplicaValor1 / (100);
  String valor = "O valor de decrescimo em porcentagem é de: " +
      porcentagemMultiplicaFinal.toString() +
      "%";
  return valor;
}

String calculoAcrescimoComDesconto(double valor1, double valor2) {
  double porcentagemCalculo = valor1 * ((valor2 / 100) - (10 / 100));
  double porcentagemFinal = porcentagemCalculo / 100;
  String valor = "O valor de acrescimo ém porcentagem é de: " +
      porcentagemFinal.toString() +
      "%";
  return valor;
}

//Função meu projeto

showMeuProjeto() {
  print('''Escolha uma opção:
  01 - Recupera vida
  02 - Calcula dano
  03 - Almenta vida limite''');

  int opcao = int.parse(stdin.readLineSync()!);

  print("Informe o valor da vida");
  int vida = int.parse(stdin.readLineSync()!);

  print("Informe o valor variante da vida");
  int varianteVida = int.parse(stdin.readLineSync()!);

  String resultado;

  if (opcao == 1) {
    resultado = escolhaFeitaRpg(vida, varianteVida, restaurarVida);
  } else if (opcao == 2) {
    resultado = escolhaFeitaRpg(vida, varianteVida, tirarVida);
  } else if (opcao == 3) {
    resultado = escolhaFeitaRpg(vida, varianteVida, bonificarViada);
  }

  print(opcao);
}

String escolhaFeitaRpg(int vida, int varianteVida, Function opcao) {
  String retorno = opcao(vida, varianteVida);
  return retorno;
}

String restaurarVida(int vida, int varianteVida) {
  int calculo = vida + varianteVida;
  return calculo.toString();
}

String tirarVida(int vida, int varianteVida) {
  int calculo = vida - varianteVida;
  return calculo.toString();
}

String bonificarViada(int vida, int varianteVida) {
  int calculo = vida + varianteVida;
  maximoVida = calculo;
  String maximoVidaMensagem = "Sua vida máxima é de: " + maximoVida.toString();
  return maximoVidaMensagem;
}
