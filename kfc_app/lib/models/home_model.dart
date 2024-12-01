class MenuItem {
  final String title;
  final String subtitle;
  final String secondTitle;
  final int price;
  final String imagePath;


  MenuItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.secondTitle,

    required this.imagePath
  });
  static final List<MenuItem> menuItems = [
    MenuItem(
      title: "Zinger Burger",
      subtitle: "Chicken Patty,Cheese,\n    Tomato,Lettuce",
      secondTitle: "Extra Cheese",
      price: 250,
      imagePath: "assets/kfc/burger.png"
    ),
    MenuItem(
      title: "Fried Chicken",
      subtitle: "2pcs Deep Fried\n  Crispy Chicken",
      secondTitle: "No Addons",
      price: 185,
        imagePath: "assets/kfc/chicken.png"
    ),
    MenuItem(
      title: "Chicken Popcorn",
      subtitle: "Chicken Popcorn\n            Large",
        secondTitle: "No Addons",
      price: 150,
        imagePath: "assets/kfc/meatbox.png"
    ),
    MenuItem(
      title: "Potato Fries",
      subtitle: "Crispy Potato Fries\n         Large",
        secondTitle: "No Addons",
      price: 120,
        imagePath: "assets/kfc/french.png"
    ),
  ];

}
