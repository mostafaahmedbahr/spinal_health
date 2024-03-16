class TypesModel{

  final String id;
  final String image;
  final String title;
  final String description;
  final String url;

  TypesModel({required this.id, required this.image,
    required this.title,
    required this.description,
    required this.url
  });


  factory TypesModel.fromMap(Map<String, dynamic> map) {
    return TypesModel(
      id: map['id'],
      image: map['image'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
    );
  }
}