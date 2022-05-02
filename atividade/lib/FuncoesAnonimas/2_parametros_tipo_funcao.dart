import 'dart:ffi';
import 'dart:io';

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

  print("Informe o valor de alteração ao salario");
  double variante = double.parse(stdin.readLineSync()!);

  String? resultado;

  if (escolha == 1) {
    resultado = calculoPorcentagemAcrecimo(salario, variante);
  }
  print(resultado);
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
