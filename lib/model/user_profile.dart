// import 'package:hive/hive.dart';
//
// class UserProfile {
//   final String userName;
//   UserProfile({required this.userName});
// }
//
// class UserProfileAdapter extends TypeAdapter<UserProfile> {
//   @override
//   final int typeId = 0; // You can choose any unique id
//
//   @override
//   UserProfile read(BinaryReader reader) {
//     // Read the username and other properties from binary
//     String username = reader.readString();
//     // You need to instantiate UserProfile with the username
//     return UserProfile(
//       userName: username,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, UserProfile obj) {
//     // Write the username to binary
//     writer.writeString(obj.userName);
//   }
// }
