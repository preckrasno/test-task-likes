part of 'liked_people_bloc.dart';

abstract class LikedPeopleEvent {}

class LikedPeopleDeletePressedEvent extends LikedPeopleEvent {
  final Person person;

  LikedPeopleDeletePressedEvent({required this.person});
}

class LikedPeopleLoadEvent extends LikedPeopleEvent {
  LikedPeopleLoadEvent();
}
