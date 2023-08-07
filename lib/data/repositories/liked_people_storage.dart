import 'package:dreambit/data/models/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikedPeopleStorage {
  Future<void> saveLikedPeople(likedPeople) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String likedPeopleJson = Person.encode(likedPeople);

    await sharedPreferences.setString(_likedPeopleKey, likedPeopleJson);
  }

  Future<List<Person>> getLikedPeople() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String? likedPeopleJson =
        sharedPreferences.getString(_likedPeopleKey);

    if (likedPeopleJson == null) {
      return [];
    }

    return Person.decode(likedPeopleJson);
  }

  Future<void> clearStorage() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.remove(_likedPeopleKey);
  }

  static const String _likedPeopleKey = 'liked_people';
}
