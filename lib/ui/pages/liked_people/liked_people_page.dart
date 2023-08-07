import 'package:dreambit/bloc/liked_people_bloc/liked_people_bloc.dart';
import 'package:dreambit/data/repositories/liked_people_repository.dart';
import 'package:dreambit/injection.dart';
import 'package:dreambit/ui/pages/liked_people/liked_people_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikedPeoplePage extends StatelessWidget {
  const LikedPeoplePage({super.key});

  static const Page page = MaterialPage<void>(child: LikedPeoplePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikedPeopleBloc(
        likedPeopleRepository: injection.get<LikedPeopleRepository>(),
      )..add(LikedPeopleLoadEvent()),
      child: const LikedPeopleContainer(),
    );
  }
}
