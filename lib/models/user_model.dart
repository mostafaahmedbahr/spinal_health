class UserModel
{
  String? name;
  String? phone;
  String? uid;
  String? email;
  String? img;
  String? bio;
  String? userType;
  String? address;

  UserModel({
    required this.uid,
    required this.phone,
    required this.email,
    required this.name,
    required this.img,
    required this.bio,
    required this.userType,
    required this.address,
  });

  UserModel.fromJson(Map<String , dynamic> json)
  {
    email = json["email"];
    name = json["name"];
    img = json["img"];
    uid = json["uid"];
    phone = json["phone"];
    bio = json["bio"];
    userType = json["userType"];
    address = json["address"];
  }

  Map<String , dynamic> toMap()
  {
    return {
      "name":name,
      "email":email,
      "uid":uid,
      "phone" : phone,
      "img" : img,
      "bio" : bio,
      "userType" : userType,
      "address" : address,
    };
  }
}