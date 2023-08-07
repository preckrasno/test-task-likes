import 'package:dreambit/bloc/people_view_bloc/person_view_bloc.dart';
import 'package:dreambit/data/repositories/liked_people_repository.dart';
import 'package:dreambit/data/repositories/people_view_api.dart';
import 'package:dreambit/data/repositories/settings_singleton.dart';
import 'package:dreambit/injection.dart';
import 'package:dreambit/ui/pages/people_view/people_view_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeopleViewPage extends StatelessWidget {
  const PeopleViewPage({super.key});

  static const Page page = MaterialPage<void>(child: PeopleViewPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PeopleViewBloc(
        peopleViewApi: injection.get<PeopleViewApi>(),
        settingsSingleton: injection.get<SettingsSingleton>(),
        likedPeopleRepository: injection.get<LikedPeopleRepository>(),
      )..add(PeopleViewLoadPersonEvent()),
      child: const PeopleViewContainer(),
    );
  }
}
