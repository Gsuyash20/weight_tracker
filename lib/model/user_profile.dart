import 'package:hive/hive.dart';

class UserProfile {
  final String userName;


  UserProfile({required this.userName});
}
class UserProfileAdapter extends TypeAdapter<String> {
  @override
  final int typeId = 0; // You can choose any unique id

  @override
  String read(BinaryReader reader) {
    return reader.readString() ?? ''; // Read the username from binary
  }

  @override
  void write(BinaryWriter writer, String obj) {
    writer.writeString(obj); // Write the username to binary
  }
}