import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'item_list.dart';

class ItemServices {
  static Future<ItemList> readOccurrencesFromJson() async {
    String jsonString = await loadJsonAsset();
    final jsonResponse = json.decode(jsonString);
    ItemList itemList = new ItemList.fromJson(jsonResponse);
    return itemList;
  }

  static Future<String> loadJsonAsset() async {
    return await new File('../arquivos/itens_list.json').readAsString();
  }
}
