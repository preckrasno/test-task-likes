import 'package:dreambit/data/models/person.dart';
import 'package:dreambit/data/repositories/liked_people_storage.dart';

class LikedPeopleRepository {
  final LikedPeopleStorage _likedPeopleStorage = LikedPeopleStorage();

  List<Person> _likedPeople = [];

  Future<void> addLikedPerson(Person person) async {
    _likedPeople.add(person);
    await _likedPeopleStorage.saveLikedPeople(_likedPeople);
  }

  Future<void> removeLikedPerson(Person person) async {
    _likedPeople.remove(person);
    await _likedPeopleStorage.saveLikedPeople(_likedPeople);
  }

  Future<List<Person>> getLikedPeople() async {
    _likedPeople = await _likedPeopleStorage.getLikedPeople();
    return _likedPeople;
  }

  Future<void> clearStorage() async {
    await _likedPeopleStorage.clearStorage();
  }
}
