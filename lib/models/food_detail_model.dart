class FoodDetailModel {
  final int id;
  final String name;
  final String image;
  final String? description;
  final double ratings;
  final double price;

  FoodDetailModel({
    required this.id,
    required this.name,
    required this.ratings,
    required this.image,
    required this.price,
    this.description,
  });
}
