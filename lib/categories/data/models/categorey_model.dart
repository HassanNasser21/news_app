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

  static List<CategoreyModel> categories_black = [
    //business entertainment general health science sports technology
    CategoreyModel(id: 'general', name: 'General', imageName: 'general_black'),
    CategoreyModel(
      id: 'business',
      name: 'Business',
      imageName: 'business_black',
    ),
    CategoreyModel(id: 'sports', name: 'Sports', imageName: 'sports_black'),
    CategoreyModel(id: 'health', name: 'Health', imageName: 'health_black'),
    CategoreyModel(
      id: 'technology',
      name: 'Technology',
      imageName: 'technology_black',
    ),
    CategoreyModel(
      id: 'entertainment',
      name: 'Entertainment',
      imageName: 'entertainment_black',
    ),
    CategoreyModel(id: 'science', name: 'Science', imageName: 'science_black'),
  ];
}
