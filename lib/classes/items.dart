class Item {
  String imgPath;
  double price;
  String name;
  String location;
  Item({
    this.location='Main Branch',
    required this.name,
    required this.imgPath,
    required this.price,
  });
}

final List<Item> items = [
  Item(name: 'product1', price: 12.99, imgPath: "assets/2.webp",location: 'tripolie'),
  Item(name: 'product2', price: 10, imgPath: "assets/3.webp",location: 'Zouk'),
  Item(name: 'product3', price: 90, imgPath: "assets/4.webp"),
  Item(name: 'product4', price: 8, imgPath: "assets/5.webp"),
  Item(name: 'product5', price: 35, imgPath: "assets/6.webp"),
  Item(name: 'product6', price: 66.7, imgPath: "assets/7.webp"),
  Item(name: 'product7', price: 19.99, imgPath: "assets/8.webp"),
  Item(name: 'product8', price: 17, imgPath: "assets/1.webp"),
];
