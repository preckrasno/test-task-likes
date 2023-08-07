import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambit/data/models/person.dart';
import 'package:dreambit/data/repositories/liked_people_repository.dart';
import 'package:dreambit/data/repositories/people_view_api.dart';
import 'package:dreambit/data/repositories/settings_singleton.dart';

part 'person_view_event.dart';
part 'person_view_state.dart';

class PeopleViewBloc extends Bloc<PeopleViewEvent, PeopleViewState> {
  final PeopleViewApi peopleViewApi;
  final SettingsSingleton settingsSingleton;
  final LikedPeopleRepository likedPeopleRepository;
  PeopleViewBloc({
    required this.peopleViewApi,
    required this.settingsSingleton,
    required this.likedPeopleRepository,
  }) : super(PeopleViewLoadingState(person: null)) {
    on<PeopleViewLoadPersonEvent>(_onPeopleViewLoadPersonEvent);
    on<PeopleViewDislikePersonEvent>(_onPeopleViewDislikePersonEvent);
    on<PeopleViewLikePersonEvent>(_onPeopleViewLikePersonEvent);
    on<PeopleViewNavigateToLikedPeopleEvent>(
        _onPeopleViewNavigateToLikedPeopleEvent);
  }

  FutureOr<void> _onPeopleViewLoadPersonEvent(
      PeopleViewLoadPersonEvent event, Emitter<PeopleViewState> emit) async {
    emit(PeopleViewLoadingState(person: state.person));

    Person? person = await peopleViewApi.getPerson(
      nationalityCode: settingsSingleton.settings.nationality?.code ?? '',
      gender: settingsSingleton.settings.gender?.name.toLowerCase() ?? '',
    );

    if (person == null) {
      emit(PeopleViewErrorState(person: state.person));
    } else {
      emit(PersonViewInitial(person: person));
    }
  }

  FutureOr<void> _onPeopleViewDislikePersonEvent(
      PeopleViewDislikePersonEvent event, Emitter<PeopleViewState> emit) async {
    emit(PeopleViewLoadingState(person: state.person));

    Person? person = await peopleViewApi.getPerson(
      nationalityCode: settingsSingleton.settings.nationality?.code ?? '',
      gender: settingsSingleton.settings.gender?.name.toLowerCase() ?? '',
    );

    if (person == null) {
      emit(PeopleViewErrorState(person: state.person));
    } else {
      emit(PersonViewInitial(person: person));
    }
  }

  FutureOr<void> _onPeopleViewLikePersonEvent(
      PeopleViewLikePersonEvent event, Emitter<PeopleViewState> emit) async {
    emit(PeopleViewLoadingState(person: state.person));

    Person? person = await peopleViewApi.getPerson(
      nationalityCode: settingsSingleton.settings.nationality?.code ?? '',
      gender: settingsSingleton.settings.gender?.name.toLowerCase() ?? '',
    );

    await likedPeopleRepository.addLikedPerson(event.person);

    if (person == null) {
      emit(PeopleViewErrorState(person: state.person));
    } else {
      emit(PersonViewInitial(person: person));
    }
  }

  FutureOr<void> _onPeopleViewNavigateToLikedPeopleEvent(
      PeopleViewNavigateToLikedPeopleEvent event,
      Emitter<PeopleViewState> emit) {
    emit(PeopleViewNavigateToLikedPeopleState(person: state.person));
  }
}
