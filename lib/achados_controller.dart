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

    static void addItemEd(int id) async {
    ItemList lista = await getItensList();
    Item item = newItemById(id);
    lista.addOccurence(item);
    writeOnJson(lista);
  }

  static void editarItem() async {
    ItemList lista = await getItensList();
    stdout.write("\n\nDigite o Id do item que deseja editar\n");
    int id = int.parse(stdin.readLineSync());
    if(lista.searchItemById(id)){
      lista.removeItem(id);
      writeOnJson(lista);
      await addItemEd(id);
    }else{
      stdout.write("\nNão existe o id informado\n");
    }
  }

  static void deleteItem() async {
    int id;
    ItemList lista = await getItensList();
    stdout.write("\n\nDigite o Id do item que deseja deletar\n");
    id = int.parse(stdin.readLineSync());
    lista.removeItem(id)
        ? stdout.write("\nItem Removido com Sucesso\n")
        : stdout.write("\nItem não removido id/arquivo não encontrado\n");
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

  static Item newItemById(int id) {
    String dataRecebido, dataEntregue, descricao;

    stdout.write("\n\Edite os dados do item perdido:\n");

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
