class Item {
  int id;
  String title;
  String price;
  bool isDelete;
  Item(this.id, this.title, this.price, this.isDelete);
}

var allItem = [
  Item(1, 'Clothes', '230', false),
  Item(2, 'Food', '30', false),
  Item(3, 'Images', '330', false),
  Item(4, 'Frames', '340', false),
  Item(5, 'Laptops', '20', false)
];
