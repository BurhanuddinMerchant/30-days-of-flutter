class Item {
  final String id;
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
}

final products = [
  Item(
      id: "123456",
      name: "burhan",
      desc: "this is burhan",
      image: "https://burhanuddinmerchant.ml/static/media/profile.ec68ec28.png",
      color: "#33505a",
      price: 10),
];
