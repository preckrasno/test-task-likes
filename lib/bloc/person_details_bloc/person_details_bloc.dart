import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambit/data/models/app_user.dart';
import 'package:dreambit/data/enums/country.dart';
import 'package:dreambit/data/enums/gender.dart';
import 'package:dreambit/data/repositories/settings_singleton.dart';
import 'package:dreambit/data/models/settings.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';

class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  final SettingsSingleton settingsSingleton;
  PersonDetailsBloc({
    required this.settingsSingleton,
  }) : super(PersonDetailsInitial()) {
    on<PersonDetailsNextPressed>(_onPersonDetailsNextPressed);
  }

  FutureOr<void> _onPersonDetailsNextPressed(
      PersonDetailsNextPressed event, Emitter<PersonDetailsState> emit) {
    settingsSingleton.appUser = event.user;
    settingsSingleton.settings =
        Settings(gender: event.gender, nationality: event.nationality);

    emit(PersonDetailsNavigateToPeopleViewState());
  }
}
