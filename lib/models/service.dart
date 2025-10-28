class Service {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String color;
  final List<String> features;
  final String estimatedTime;
  final String priceRange;

  const Service({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.features,
    required this.estimatedTime,
    required this.priceRange,
  });
}
