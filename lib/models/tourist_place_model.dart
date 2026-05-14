class TouristPlaceModel {
  final String name;
  final String description;
  final String category;
  final bool wantToVisit;
  final double rating;
  final double distance;
  final String city;
  final bool isFree;

  TouristPlaceModel({
    required this.name,
    required this.description,
    required this.category,
    required this.wantToVisit,
    required this.rating,
    required this.distance,
    required this.city,
    required this.isFree,
  });
}
