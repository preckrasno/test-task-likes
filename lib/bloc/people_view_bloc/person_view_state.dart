part of 'person_view_bloc.dart';

abstract class PeopleViewState {
  final Person? person;

  PeopleViewState({this.person});
}

class PersonViewInitial extends PeopleViewState {
  PersonViewInitial({required super.person});
}

class PeopleViewLoadingState extends PeopleViewState {
  PeopleViewLoadingState({required super.person});
}

class PeopleViewErrorState extends PeopleViewState {
  PeopleViewErrorState({required super.person});
}

class PeopleViewNavigateToLikedPeopleState extends PeopleViewState {
  PeopleViewNavigateToLikedPeopleState({required super.person});
}
