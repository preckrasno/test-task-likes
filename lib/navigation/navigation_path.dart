import 'package:dreambit/ui/pages/liked_people/liked_people_page.dart';
import 'package:dreambit/ui/pages/people_view/people_view_page.dart';
import 'package:dreambit/ui/pages/person_details/person_details_page.dart';
import 'package:flutter/material.dart';

enum NavigationPath {
  personDetails('/personDetails', page: PersonDetailsPage.page),
  peopleView('/peopleView', page: PeopleViewPage.page),
  likedPeople('/likedPeople', page: LikedPeoplePage.page);

  final String string;
  final Page page;

  const NavigationPath(
    this.string, {
    required this.page,
  });
}
