import 'dart:math';

class PlantModel {
  final String name;
  final String imagePath;
  final String price;

  PlantModel(
      {required this.name, required this.imagePath, required this.price});



  static String generateRandomPrice() {
    final random = Random.secure();
    return '${random.nextInt(24) + 9}.${random.nextInt(9)}${random.nextInt(9)}';
  }


  static final List<PlantModel> plantList = [
    PlantModel(name: 'Cactus',
        imagePath: 'assets/plants/plants_0.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Palm',
        imagePath: 'assets/plants/plants_1.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Pine',
        imagePath: 'assets/plants/plants_2.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Fern',
        imagePath: 'assets/plants/plants_3.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Aloe Vera',
        imagePath: 'assets/plants/plants_4.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Succulent',
        imagePath: 'assets/plants/plants_5.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Bamboo',
        imagePath: 'assets/plants/plants_6.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Bonsai',
        imagePath: 'assets/plants/plants_7.png',
        price: generateRandomPrice()),
    PlantModel(name: 'Orchid',
        imagePath: 'assets/plants/plants_8.png',
        price: generateRandomPrice()),
  ];
}