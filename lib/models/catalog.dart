class CatalogModel {
  static List<Item> items = [];
  // get item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final int price;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.image,
      required this.price});
  factory Item.fromMap(Map<String, dynamic> map) => Item(
      color: map["color"],
      id: map["id"],
      desc: map["desc"],
      image: map["image"],
      name: map["name"],
      price: map["price"]);
  toMap() => {
        "id": id,
        "name": name,
        "color": color,
        "desc": desc,
        "image": image,
        "price": price,
      };
}
