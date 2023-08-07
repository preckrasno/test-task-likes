part of 'liked_people_bloc.dart';

abstract class LikedPeopleState {
  final List<Person> people;

  LikedPeopleState({this.people = const []});
}

class LikedPeopleInitial extends LikedPeopleState {
  LikedPeopleInitial({required super.people});
}

class LikedPeopleLoadingState extends LikedPeopleState {
  LikedPeopleLoadingState({required super.people});
}
