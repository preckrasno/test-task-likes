part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class NavigationCheckTheirTokenEvent extends NavigationEvent {}

class NavigationPushPageEvent extends NavigationEvent {
  NavigationPushPageEvent({
    required this.path,
    this.canPop = true,
    this.replace = false,
  });

  final NavigationPath path;
  final bool canPop;
  final bool replace;
}

class NavigationPopPageEvent extends NavigationEvent {}

class NavigationIsUserSignedInEvent extends NavigationEvent {}
