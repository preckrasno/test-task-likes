import 'package:dreambit/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:dreambit/bloc/people_view_bloc/person_view_bloc.dart';
import 'package:dreambit/data/models/person.dart';
import 'package:dreambit/navigation/navigation_path.dart';
import 'package:dreambit/ui/widgets/people_view/people_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeopleViewContainer extends StatelessWidget {
  const PeopleViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    PeopleViewBloc peopleViewBloc = context.read<PeopleViewBloc>();
    NavigationBloc navigationBloc = context.read<NavigationBloc>();
    return BlocConsumer<PeopleViewBloc, PeopleViewState>(
      listener: (context, state) {
        if (state is PeopleViewNavigateToLikedPeopleState) {
          navigationBloc
              .add(NavigationPushPageEvent(path: NavigationPath.likedPeople));
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            navigationBloc.add(NavigationPopPageEvent());
            return Future.value(false);
          },
          child: PeopleViewWidget(
            isLoading: state is PeopleViewLoadingState,
            onNavigateToLikedPeople: _onNavigateToLikedPeople(peopleViewBloc),
            onDislikePerson: _onDislikePerson(peopleViewBloc),
            onLikePerson: _onLikePerson(peopleViewBloc),
            person: state.person,
          ),
        );
      },
    );
  }

  _onLikePerson(PeopleViewBloc peopleViewBloc) {
    return (Person person) =>
        peopleViewBloc.add(PeopleViewLikePersonEvent(person: person));
  }

  _onDislikePerson(PeopleViewBloc peopleViewBloc) {
    return () => peopleViewBloc.add(PeopleViewDislikePersonEvent());
  }

  _onNavigateToLikedPeople(PeopleViewBloc peopleViewBloc) {
    return () => peopleViewBloc.add(PeopleViewNavigateToLikedPeopleEvent());
  }
}
