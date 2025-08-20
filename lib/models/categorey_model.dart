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
    //business entertainment general health science sports technology
    CategoreyModel(id: 'general', name: 'General', imageName: 'general'),
    CategoreyModel(id: 'business', name: 'Business', imageName: 'business'),
    CategoreyModel(id: 'sports', name: 'Sports', imageName: 'sports'),
    CategoreyModel(id: 'health', name: 'Health', imageName: 'health'),
    CategoreyModel(
      id: 'technology',
      name: 'Technology',
      imageName: 'technology',
    ),
    CategoreyModel(
      id: 'entertainment',
      name: 'Entertainment',
      imageName: 'entertainment',
    ),
    CategoreyModel(id: 'science', name: 'Science', imageName: 'science'),
  ];
}
