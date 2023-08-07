import 'package:dreambit/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:dreambit/navigation/navigation_path.dart';
import 'package:dreambit/ui/pages/loading/loading_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  List<Page> onGeneratePages(NavigationState state, List<Page> pages) {
    final List<NavigationPath> paths = [...state.paths];

    if (paths.isEmpty) return [LoadingPage.page];

    final List<Page> pages = paths.map<Page>((path) => path.page).toList();

    return pages;
  }
}
