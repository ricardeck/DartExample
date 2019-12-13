import 'item.dart';

class ItemList {
  final List<Item> _itens;

  ItemList(this._itens);

  List<Item> get itens => _itens;

  void addOccurence(Item item) {
    this._itens.add(item);
  }

  bool removeItem(int receivedId) {
    this._itens.removeWhere((item) => item.id == receivedId);
    return searchItemById(receivedId) ? false : true;
  }

  bool searchItemById(int receivedId) {
    bool ok = false;
    for (var item in this._itens) {
      if (item.id == receivedId) {
        ok = true;
      }
    }
    return ok;
  }

  factory ItemList.fromJson(List<dynamic> parsedJson) {
    List<Item> itens = new List<Item>();
    itens = parsedJson.map((i) => Item.fromJson(i)).toList();
    return new ItemList(itens);
  }

  Set<List<Item>> toJson() => {_itens};
}
