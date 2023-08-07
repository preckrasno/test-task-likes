import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambit/navigation/navigation_path.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(const NavigationInitial(
          paths: [NavigationPath.personDetails],
        )) {
    on<NavigationPushPageEvent>(_onNavigationPushPageEvent);
    on<NavigationPopPageEvent>(_onNavigationPopPageEvent);
  }

  FutureOr<void> _onNavigationPushPageEvent(
      NavigationPushPageEvent event, Emitter<NavigationState> emit) {
    final paths = [...state.paths];
    event.canPop ? null : paths.removeLast();
    event.replace ? paths.clear() : null;
    paths.add(event.path);
    emit(NavigationOpenPageState(paths: paths));
  }

  FutureOr<void> _onNavigationPopPageEvent(
      NavigationPopPageEvent event, Emitter<NavigationState> emit) {
    if (state.paths.length <= 1) return null;

    final paths = [...state.paths];

    paths.removeLast();
    emit(NavigationOpenPageState(paths: paths));
  }
}
