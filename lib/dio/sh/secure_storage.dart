//
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// import '../../core/utils/constants/constant.dart';
//
// class SecureStorage {
//
//   //static SecureStorage? secureStorage;
//   final FlutterSecureStorage storage = const FlutterSecureStorage();
//
//
//   writeSecureData(String key, String value) async {
//     await storage.write(key: key, value: value);
//   }
//
//   readSecureData(String key) async {
//     String value = await storage.read(key: key) ?? "No Data";
//     print(value);
//     print("mostafa read");
//   }
//
//   deleteSecureData(String key) async {
//     await storage.delete(key: key);
//     print("mostafa delete");
//   }
// }
