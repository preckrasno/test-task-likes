part of 'navigation_bloc.dart';

abstract class NavigationState {
  const NavigationState({
    required this.paths,
  });

  final List<NavigationPath> paths;
}

class NavigationInitial extends NavigationState {
  const NavigationInitial({
    super.paths = const [],
  });
}

class NavigationOpenPageState extends NavigationState {
  const NavigationOpenPageState({
    required super.paths,
  });
}
