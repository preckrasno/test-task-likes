import 'package:dreambit/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:dreambit/bloc/person_details_bloc/person_details_bloc.dart';
import 'package:dreambit/data/models/app_user.dart';
import 'package:dreambit/data/enums/country.dart';
import 'package:dreambit/data/enums/gender.dart';
import 'package:dreambit/navigation/navigation_path.dart';
import 'package:dreambit/ui/widgets/person_details/person_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailsContainer extends StatelessWidget {
  const PersonDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    PersonDetailsBloc personDetailsBloc = context.read<PersonDetailsBloc>();
    NavigationBloc navigationBloc = context.read<NavigationBloc>();
    return BlocConsumer<PersonDetailsBloc, PersonDetailsState>(
      listener: (context, state) {
        if (state is PersonDetailsNavigateToPeopleViewState) {
          navigationBloc
              .add(NavigationPushPageEvent(path: NavigationPath.peopleView));
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            navigationBloc.add(NavigationPopPageEvent());
            return Future.value(false);
          },
          child: PersonDetailsWidget(
            onNext: _onNext(personDetailsBloc),
          ),
        );
      },
    );
  }
}

_onNext(PersonDetailsBloc personDetailsBloc) {
  return ({
    required Gender gender,
    required Country nationality,
    required AppUser user,
  }) {
    personDetailsBloc.add(PersonDetailsNextPressed(
      gender: gender,
      nationality: nationality,
      user: user,
    ));
  };
}
