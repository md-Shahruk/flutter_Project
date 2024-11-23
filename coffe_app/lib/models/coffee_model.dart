class Coffee {
  final String title; // Name of the coffee
  final String subtitle; // Special description
  final double price; // Price in dollars
  final double rating; // Rating out of 5.0
  final String imagePath; // Path to the image asset

  Coffee({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  static final List<Coffee> coffeeList = [
    Coffee(
      title: "Espresso",
      subtitle: "Strong and rich",
      price: 3.5,
      rating: 4.8,
      imagePath: "assets/coffee/coffe_0.png",
    ),
    Coffee(
      title: "Latte",
      subtitle: "Smooth and creamy",
      price: 4.0,
      rating: 4.5,
      imagePath: "assets/coffee/coffe_1.png",
    ),
    Coffee(
      title: "Cappuccino",
      subtitle: "Frothy delight",
      price: 4.2,
      rating: 4.7,
      imagePath: "assets/coffee/coffe_2.png",
    ),
    Coffee(
      title: "Mocha",
      subtitle: "Chocolate and coffee",
      price: 4.5,
      rating: 4.6,
      imagePath: "assets/coffee/coffe_3.png",
    ),
    Coffee(
      title: "Americano",
      subtitle: "Simple and bold",
      price: 3.0,
      rating: 4.4,
      imagePath: "assets/coffee/coffe_4.png",
    ),
    Coffee(
      title: "Macchiato",
      subtitle: "Bold with a hint of milk",
      price: 3.8,
      rating: 4.5,
      imagePath: "assets/coffee/coffe_1.png",
    ),
    Coffee(
      title: "Cappuccino",
      subtitle: "Frothy delight",
      price: 4.2,
      rating: 4.7,
      imagePath: "assets/coffee/coffe_2.png",
    ),
    Coffee(
      title: "Mocha",
      subtitle: "Chocolate and coffee",
      price: 4.5,
      rating: 4.6,
      imagePath: "assets/coffee/coffe_3.png",
    ),
  ];

}


