class CategoreyModel {
  String id;
  String name;
  String imageName;

  CategoreyModel({
    required this.id,
    required this.name,
    required this.imageName,
  });
  static List<CategoreyModel> categories = [
    CategoreyModel(id: '3', name: 'General', imageName: 'general'),
    CategoreyModel(id: '1', name: 'Business', imageName: 'business'),
    CategoreyModel(id: '6', name: 'Sports', imageName: 'sports'),
    CategoreyModel(id: '4', name: 'Health', imageName: 'health'),
    CategoreyModel(id: '7', name: 'Technology', imageName: 'technology'),
    CategoreyModel(id: '2', name: 'Entertainment', imageName: 'entertainment'),
    CategoreyModel(id: '5', name: 'Science', imageName: 'science'),
  ];
}
