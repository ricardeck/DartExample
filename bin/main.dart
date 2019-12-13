import 'dart:io';
import 'dart:convert';
import '../lib/achados_controller.dart';

main(List<String> arguments) async {

  int exit = 0;

  while (exit != 1) {
    menu();
    String op = stdin.readLineSync();

    switch (op) {
      case '1':
        await AchadosController.showAll();
        break;

      case '2':
        await AchadosController.addItem();
        break;


      case '3':
        await AchadosController.deleteItem();
        break;
      
      case '4':
        await AchadosController.editarItem();
        break;

      case '0':
        exit = 1;
        break;

      default:
        stdout.write("\nSelecione uma opção válida!\n");
        break;
    }
  }
  stdout.write("\n\nApp Fechado.\n");
}

void menu() {
  stdout.write("\n\nSelecione a opção desejada:\n");
  stdout.write("\n1 - Mostrar todos os itens encontrados\n");
  stdout.write("\n2 - Adicionar novo item\n");
  stdout.write("\n3 - Remover um item\n");
  stdout.write("\n4 - Editar um item\n");
  stdout.write("\n0 - Exit the program\n");
}
