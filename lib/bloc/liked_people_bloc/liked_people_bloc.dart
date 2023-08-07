import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambit/data/models/person.dart';
import 'package:dreambit/data/repositories/liked_people_repository.dart';

part 'liked_people_event.dart';
part 'liked_people_state.dart';

class LikedPeopleBloc extends Bloc<LikedPeopleEvent, LikedPeopleState> {
  final LikedPeopleRepository likedPeopleRepository;
  LikedPeopleBloc({
    required this.likedPeopleRepository,
  }) : super(LikedPeopleLoadingState(people: [])) {
    on<LikedPeopleLoadEvent>(_onLikedPeopleLoadEvent);
    on<LikedPeopleDeletePressedEvent>(_onLikedPeopleDeletePressedEvent);
  }

  FutureOr<void> _onLikedPeopleLoadEvent(
      LikedPeopleLoadEvent event, Emitter<LikedPeopleState> emit) async {
    emit(LikedPeopleLoadingState(people: state.people));

    List<Person> people = await likedPeopleRepository.getLikedPeople();

    emit(LikedPeopleInitial(people: people));
  }

  FutureOr<void> _onLikedPeopleDeletePressedEvent(
      LikedPeopleDeletePressedEvent event,
      Emitter<LikedPeopleState> emit) async {
    await likedPeopleRepository.removeLikedPerson(event.person);

    List<Person> people = [...state.people]..remove(event.person);
    emit(LikedPeopleInitial(people: people));
  }
}
