import 'package:dreambit/bloc/liked_people_bloc/liked_people_bloc.dart';
import 'package:dreambit/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:dreambit/data/models/person.dart';
import 'package:dreambit/ui/widgets/liked_people/liked_people_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikedPeopleContainer extends StatelessWidget {
  const LikedPeopleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    LikedPeopleBloc likedPeopleBloc = context.read<LikedPeopleBloc>();
    NavigationBloc navigationBloc = context.read<NavigationBloc>();
    return BlocConsumer<LikedPeopleBloc, LikedPeopleState>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            navigationBloc.add(NavigationPopPageEvent());
            return Future.value(false);
          },
          child: LikedPeopleWidget(
            isLoading: state is LikedPeopleLoadingState,
            people: state.people,
            onPersonDelete: _onPersonDelete(likedPeopleBloc),
          ),
        );
      },
    );
  }

  _onPersonDelete(LikedPeopleBloc likedPeopleBloc) {
    return (Person person) =>
        likedPeopleBloc.add(LikedPeopleDeletePressedEvent(person: person));
  }
}
