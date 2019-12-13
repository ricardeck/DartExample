import 'dart:io';
import 'dart:convert';
import 'package:achados_e_perdidos/item.dart';
import 'package:achados_e_perdidos/item_list.dart';
import 'package:achados_e_perdidos/item_services.dart';

class AchadosController {
  static void showAll() async {

    ItemList lista = await getItensList();
    lista.itens.forEach((item) => item.printData());


  }
    static void addItem() async {
    ItemList lista = await getItensList();
    Item item = newItem();
    lista.addOccurence(item);
    writeOnJson(lista);
  }

  static Future<ItemList> getItensList() async {
  Future<ItemList> itemList =
      ItemServices.readOccurrencesFromJson();
  ItemList lista;
  await itemList
      .then((result) => lista = new ItemList(result.itens));
  return lista;
  }

    static Item newItem() {
    String dataRecebido, dataEntregue, descricao;
    int id;

    stdout.write("\n\nAdicione os dados do item perdido:\n");
    stdout.write("\nID:\n");
    id = int.parse(stdin.readLineSync());

    stdout.write("\nData do recebimento\n");
    dataRecebido = stdin.readLineSync();

    stdout.write("\nDescricao do item\n");
    descricao = stdin.readLineSync();

    stdout.write("\nData que foi entregue ao dono:\n");
    dataEntregue = stdin.readLineSync();
    return new Item(id, dataRecebido, dataEntregue, descricao, );
  }

    static void writeOnJson(ItemList lista) {
    var str = json.encode(lista.itens);
    File file = new File("../arquivos/itens_list.json");
    file.writeAsStringSync(str);
  }

}
