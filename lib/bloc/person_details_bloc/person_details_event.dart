part of 'person_details_bloc.dart';

abstract class PersonDetailsEvent {}

class PersonDetailsNextPressed extends PersonDetailsEvent {
  final AppUser user;
  final Gender gender;
  final Country nationality;

  PersonDetailsNextPressed({
    required this.gender,
    required this.nationality,
    required this.user,
  });
}
