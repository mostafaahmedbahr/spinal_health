class SliderImageModel{

  final String id;
  final String image;

  SliderImageModel({required this.id, required this.image});


  factory SliderImageModel.fromMap(Map<String, dynamic> map) {
    return SliderImageModel(
      id: map['id'],
      image: map['image'],
    );
  }
}