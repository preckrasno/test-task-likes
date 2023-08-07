part of 'person_view_bloc.dart';

abstract class PeopleViewEvent {}

class PeopleViewLoadPersonEvent extends PeopleViewEvent {}

class PeopleViewNavigateToLikedPeopleEvent extends PeopleViewEvent {}

class PeopleViewLikePersonEvent extends PeopleViewEvent {
  final Person person;

  PeopleViewLikePersonEvent({required this.person});
}

class PeopleViewDislikePersonEvent extends PeopleViewEvent {}
