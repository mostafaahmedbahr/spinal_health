class AllPatientModel{

  final String address;
  final String age ;
  final String condition;
  final String id;
  final String name;
  final String url;

  AllPatientModel({
    required this.address,
    required this.age,
    required this.condition,
    required this.id,
    required this.name,
    required this.url,
  });


  factory AllPatientModel.fromMap(Map<String, dynamic> map) {
    return AllPatientModel(
      address: map['address'] ?? '',
      age: map['age']?? '',
      condition: map['condition']?? '',
      id: map['id']?? '',
      name: map['name']?? '',
      url: map['url']?? '',
    );
  }
}