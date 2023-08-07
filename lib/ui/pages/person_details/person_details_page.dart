import 'package:dreambit/bloc/person_details_bloc/person_details_bloc.dart';
import 'package:dreambit/data/repositories/settings_singleton.dart';
import 'package:dreambit/injection.dart';
import 'package:dreambit/ui/pages/person_details/person_details_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailsPage extends StatelessWidget {
  const PersonDetailsPage({super.key});

  static const Page page = MaterialPage<void>(child: PersonDetailsPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonDetailsBloc(
        settingsSingleton: injection.get<SettingsSingleton>(),
      ),
      child: const PersonDetailsContainer(),
    );
  }
}
