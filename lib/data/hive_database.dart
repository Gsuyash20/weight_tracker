import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../model/user_profile.dart';
import '../model/weight_entry.dart';


class HiveDatabase {
  static const String _userProfileBoxName = 'user_profiles';
  static const String _weightEntryBoxName = 'weight_entries';

  late Box<UserProfile> _userProfileBox;
  late Box<WeightEntry> _weightEntryBox;

  HiveDatabase() {
    _openBoxes();
  }

  Future<void> _openBoxes() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    _userProfileBox = await Hive.openBox<UserProfile>(_userProfileBoxName);
    _weightEntryBox = await Hive.openBox<WeightEntry>(_weightEntryBoxName);
  }

  Future<void> deleteUserDatabase() async {
    await _userProfileBox.clear(); // Clear user profiles
    await _weightEntryBox.clear(); // Clear weight entries
  }

  // User Profile CRUD operations

  Future<void> addUserProfile(UserProfile userProfile) async {
    await _userProfileBox.add(userProfile);
  }

  List<UserProfile> getUserProfiles() {
    return _userProfileBox.values.toList();
  }

  Future<void> updateUserProfile(int index, UserProfile updatedProfile) async {
    await _userProfileBox.putAt(index, updatedProfile);
  }

  Future<void> deleteUserProfile(int index) async {
    await _userProfileBox.deleteAt(index);
  }

  // Weight Entry CRUD operations

  Future<void> addWeightEntry(WeightEntry weightEntry) async {
    await _weightEntryBox.add(weightEntry);
  }

  List<WeightEntry>getWeightEntries() {
    return _weightEntryBox.values.toList();
  }

  Future<void> updateWeightEntry(int index, WeightEntry updatedEntry) async {
    await _weightEntryBox.putAt(index, updatedEntry);
  }

  Future<void> deleteWeightEntry(int index) async {
    await _weightEntryBox.deleteAt(index);
  }
}
