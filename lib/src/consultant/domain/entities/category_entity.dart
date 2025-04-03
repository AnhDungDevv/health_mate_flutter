class CategoryResEntity {
  final String status;
  final String message;
  final CategoryEntity data;

  CategoryResEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class CategoryEntity {
  final String id;
  final String name;
  final String imageURL;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageURL,
  });
}
