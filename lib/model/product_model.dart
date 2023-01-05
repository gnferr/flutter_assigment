class Product {
  final String name;
  final String category;
  final int quantity;

  Product({required this.name, required this.category, required this.quantity});

  static List<Product> products = [
    Product(name: "Soto Lamongan", category: "Food", quantity: 12),
    Product(name: "Pecel Lele", category: "Food", quantity: 10),
    Product(name: "Pecel Ayam", category: "Food", quantity: 9),
    Product(name: "RTX 3060", category: "Electronic", quantity: 5),
    Product(name: "Mobo H410", category: "Electronic", quantity: 12),
    Product(name: "Hoodie", category: "Clothes", quantity: 18),
    Product(name: "Celana Dalam", category: "Clothes", quantity: 8),
  ];
}
